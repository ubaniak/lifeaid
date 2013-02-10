class Project < ActiveRecord::Base
  attr_accessible :content, :title, :status_id

  validates :content, :presence => true
  validates :title, :presence => true
  validates :user_id, :presence => true

  belongs_to :user
  belongs_to :status
end
