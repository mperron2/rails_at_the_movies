class Movie < ApplicationRecord
  belongs_to :production_company

  has_many :movie_genre
  has_many :genres, through: :movie_genres

  validates :title, :year, :duration, :description, :average_vote, presence: true
  validates :year, :duration, numericality: { only_integer: true }
  validates :average_vote, numericality: true
end
