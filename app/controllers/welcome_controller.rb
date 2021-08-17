class WelcomeController < ApplicationController
  def index
    @game_days = GameDay.days
  end
end
