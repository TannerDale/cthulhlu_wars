class CanAttendsController < ApplicationController
  def update
    if params[:game_days]
      User.find(session[:user_id]).game_days = GameDay.find(params[:game_days])
    else
      User.find(session[:user_id]).game_days = []
    end

    redirect_to root_path
  end
end
