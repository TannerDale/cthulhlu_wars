class TeamsController < ApplicationController
  def show
  end

  def edit
    @team = Team.first
  end

  def update
    team = Team.first
    if team.authenticate(params[:password])
      session[:validated] = true

      flash[:notice] = 'Welcome to the team! '
      redirect_to root_path
    else
      flash[:alert] = 'Invalid Password'

      render :edit
    end
  end
end
