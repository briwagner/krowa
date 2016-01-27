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

  def average_score
    total = 0
    self.reviews.each do |review|
      total += review.rating
    end
    return total/self.reviews.length if self.reviews.length != 0
    return 0
  end

end
