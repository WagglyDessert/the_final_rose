class OutingsController < ApplicationController
  def index
    @outing = Outing.all
  end
  
  def show
    @outing = Outing.find(params[:id])
  end
end