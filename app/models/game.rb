class Game < ActiveRecord::Base
  has_many :collections
  has_many :users, through: :collections
  has_many :reviews
  has_many :taggings
  has_many :tags, through: :taggings
end
