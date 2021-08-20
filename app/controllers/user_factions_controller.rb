class UserFactionsController < ApplicationController
  def new
  end

  def edit
    @user = current_user
  end

  def update
    if params[:factions]
      User.find(params[:user_id]).factions = Faction.find(params[:factions])
    else
      User.find(params[:user_id]).factions = []
    end

    redirect_to profile_path
  end
end
