class Bachelorettes::ContestantsController < ApplicationController

  def index
 
    @bachelorette = Bachelorette.find(params[:id])
    #@contestants = Bachelorette.find(params[:id]).contestants
  end


end 