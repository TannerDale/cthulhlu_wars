class GameDaysController < ApplicationController
  def create
    binding.pry
    GameDay.create!({
      day: params[:day]
    })
    redirect_to '/admin/dashboard'
  end

  def destroy
    GameDay.destroy(params[:id])
    redirect_to '/admin/dashboard'
  end
end
