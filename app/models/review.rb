class Review < ActiveRecord::Base
  belongs_to :game
  belongs_to :reviewer, class_name: "User"
end
