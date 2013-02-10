class Newsletter < ActiveRecord::Base
  attr_accessible :content, :title, :user_id
  belongs_to :users
end
