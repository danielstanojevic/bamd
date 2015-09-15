class GamesController < ApplicationController
  def index
    if params[:search]
      @games = Game.search(params[:search]).order("created_at DESC").page(params[:page]).per(10)
    else
      @games = Game.all.page(params[:page]).per(10)
    end
    render 'index'
  end

  def show
    @rating = Rating.new
    @game = Game.find_by_id(params[:id])
    render 'show'
  end

end
