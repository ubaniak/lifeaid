class Image < ActiveRecord::Base
  attr_accessible :description, :photo
  belongs_to :gallery

  has_attached_file :photo, :style => { :small => "150x150>" },
                            :url => "/assets/images/:attachment/:id/:style/:basename.:extension",
                            :path => ":rails_root/public/assets/images/:attachment/:id/:style/:basename.:extension"
  
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 10.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg','image/png']
end
