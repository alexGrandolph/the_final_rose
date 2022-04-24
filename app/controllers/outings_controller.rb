class OutingsController < ApplicationController

  def show
    @outing = Outing.find(params[:id])
    # binding.pry
  end
  

end 