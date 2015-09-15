class PurchasesController < ApplicationController

  def new
  end

  def create
    @purchase = current_user.purchases.create(game_id: params[:game_id])
    redirect_to games_path
  end

  def destroy
    @purchase = current_user.purchases.find(params[:id]).destroy
    redirect_to games_path
  end

end