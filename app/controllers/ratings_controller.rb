class RatingsController < ApplicationController
  def new
    @rating = Rating.new
  end
  def create
    @game = Game.find(params[:game_id])
    p params
    @rating = Rating.new(rating_params)
    @game.ratings << @rating
    redirect_to @game
  end

  private

  def rating_params
    params.require(:rating).permit(:stars, :comment)
  end

end
