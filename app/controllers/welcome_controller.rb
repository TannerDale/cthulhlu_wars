class WelcomeController < ApplicationController
  def index
    if current_user
      @game_days = GameDay.days
    else
      redirect_to '/teams/1/edit'
    end
  end
end
