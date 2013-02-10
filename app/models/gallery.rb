class Gallery < ActiveRecord::Base
  attr_accessible :title, :project_id
  has_many :images
end
