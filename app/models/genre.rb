class Genre < ApplicationRecord
  has_many :movie_genre
  has_many :movie, through: :movie_genre

  validates :name, presence: true, uniqueness: true
end
