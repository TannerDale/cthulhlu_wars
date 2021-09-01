class WelcomeController < ApplicationController
  def index
    if current_user
      @game_days = GameDay.days
    else
      redirect_to '/join_team'
    end
  end
end
