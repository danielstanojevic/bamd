class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end
  def show
    @mechanic = Mechanic.find_by_id(params[:id])
  end
end
