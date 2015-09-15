class RatingsController < ApplicationController
  def new
    @rating = Rating.new
  end

  def create
    @game = Game.find(params[:game_id])
    @rating = Rating.new(rating_params)
    @game.ratings << @rating
    current_user.ratings << @rating
    redirect_to @game
  end

  def show #added for pagination...might need to remove
    @game = Game.find(params[:id])
    @ratings = Rating.order(:name).page params[:page]
  end

  private

  def rating_params
    params.require(:rating).permit(:stars, :comment)
  end

end
