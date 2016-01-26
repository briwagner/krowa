class Game < ActiveRecord::Base

  searchkick

  has_many :collections
  has_many :users, through: :collections
  has_many :reviews
  has_many :taggings
  has_many :tags, through: :taggings


  def short_description
    short_string = self.description.slice(0..200) + ". . . "
  end
end
