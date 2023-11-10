class BachelorettesController < ApplicationController
  def index
    @bachelorette = Bachelorette.all
  end
  
  def show
    @bachelorette = Bachelorette.find(params[:id])
  end
end