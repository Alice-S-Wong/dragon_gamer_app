class Game < ApplicationRecord
  has_many :reviews
  has_many :list_items
  has_many :lists, through: :list_items
  has_many :game_platforms
  has_many :platforms, through: :game_platforms
  has_many :game_genres
  has_many :genres, through: :game_genres
  has_many :videos
  has_many :release_dates
  def average_rating
    ratings = []
    self.reviews.each do |review|
      ratings << review[:rating]
    end
    if ratings.length != 0
      return ratings.sum / ratings.length
    else
      return
    end
  end
end
