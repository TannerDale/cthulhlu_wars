class UserStrategiesController < ApplicationController
  def show
    @strategies = Strategy.where(user_id: current_user.id, faction_id: params[:id])
  end
end
