class RatingsController < ApplicationController
  def new
    @rating = Rating.new
  end
  def create
    @rating = Rating.new(params[:rating])
  end
end
