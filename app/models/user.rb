class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :description ,:password, :password_confirmation, :photo, :first_contact, :second_contact, :should_show

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true,
                   :length => { :maximum => 50 }
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }

  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..40 }

  before_save :encrypt_password

  has_attached_file :photo, :style => { :small => "150x150>" },
                            :url => "/assets/images/profile/:attachment/:id/:style/:basename.:extension",
                            :path => ":rails_root/public/assets/images/profile/:attachment/:id/:style/:basename.:extension"
  
  validates_attachment_size :photo, :less_than => 10.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg','image/png']

  has_many :newsletters
  has_many :projects

  def show_user?
      self.should_show == 1
  end

  def has_password?(password)
    password_h == encrypt(password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(password)
  end

  private
    
    def encrypt_password
      self.salt = make_salt if new_record?
      self.password_h = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
