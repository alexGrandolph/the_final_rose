class Bachelorettes::BachelorettesController < ApplicationController

  def show
    @bachelorette = Bachelorette.find(params[:id])
 
  end
  

end 