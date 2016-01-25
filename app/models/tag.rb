class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :games, through: :taggings

end
