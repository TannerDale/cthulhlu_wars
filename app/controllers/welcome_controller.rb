class WelcomeController < ApplicationController
  def index
    @game_days = GameDay.all
  end
end
