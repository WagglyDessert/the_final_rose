class OutingsController < ApplicationController
  def index
    @outing = Outing.all
  end
  
  def show
    @outing = Outing.find(params[:id])
  end

  def update
    @outing = Outing.find(params[:outing_id])
    @contestant = Contestant.find(params[:contestant_id])
    @outing.contestants.delete(@contestant)
    redirect_to "/outings/#{@outing.id}"
  end
end