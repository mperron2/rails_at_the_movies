class MoviesController < ApplicationController
  def index
    @movies = Movie.includes(:production_company).order("average_vote DESC")
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
