class Gallery < ActiveRecord::Base
  attr_accessible :title
  has_many :images
end
