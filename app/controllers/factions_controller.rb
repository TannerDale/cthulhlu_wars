class FactionsController < ApplicationController
  def index
    @factions = Faction.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
    @faction = Faction.find(params[:id])
  end

  def destroy
  end
end
