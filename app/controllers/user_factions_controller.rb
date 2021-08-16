class UserFactionsController < ApplicationController
  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if params[:factions]
      User.find(params[:user_id]).factions = Faction.find(params[:factions])
    else
      User.find(params[:user_id]).factions = []
    end

    redirect_to "/users/#{params[:user_id]}"
  end
end
