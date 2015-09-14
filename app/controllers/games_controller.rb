class GamesController < ApplicationController
  def index
    @games = Game.all
    render 'index'
  end

  def show
    @user = User.new
    @game = Game.find_by_id(params[:id])
    render 'show'
  end

end
