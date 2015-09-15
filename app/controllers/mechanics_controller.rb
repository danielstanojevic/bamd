class MechanicsController < ApplicationController

  def index
    if params[:search]
      @mechanics = Mechanic.search(params[:search]).order("created_at DESC")
    else
      @mechanics = Mechanic.order("created_at DESC")
    end
  end

  def show
    @mechanic = Mechanic.find_by_id(params[:id])
  end

end
