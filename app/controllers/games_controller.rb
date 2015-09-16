class GamesController < ApplicationController

  def index
    if params[:search]
      @games = Game.search(params[:search]).order("created_at DESC").page(params[:page]).per(10)
    else
      # @games = Game.order("created_at DESC").page(params[:page]).per(10)
      @games = Kaminari.paginate_array(Game.order_by_user_friend_rating).page(params[:page]).per(10)
    end
    render 'index'
  end

  def show
    @rating = Rating.new
    @game = Game.find_by_id(params[:id])
    # @games = Kaminari.paginate_array(Game.order_by_user_friend_rating).page(params[:page]).per(10)
    @ratings = @game.ratings.order("created_at DESC").page(params[:page]).per(5)
    render 'show'
  end

end
