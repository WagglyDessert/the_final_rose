class ContestantsController < ApplicationController
  def index
    @contestant = Contestant.all
  end
  
  def show
    @contestant = Contestant.find(params[:id])
  end
end