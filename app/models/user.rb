class User < ActiveRecord::Base
  has_many :collections
  has_many :games, through: :collections
  has_many :reviews, foreign_key: :reviewer_id
end
