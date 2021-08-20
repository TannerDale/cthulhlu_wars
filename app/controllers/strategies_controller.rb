class StrategiesController < ApplicationController
  def index
    @strategies = Strategy.where(user_id: current_user.id, faction_id: params[:faction_id])
  end

  def create
    strategy = Strategy.create({
      user_id: current_user.id,
      faction_id: params[:faction_id],
      turn: params[:turn],
      description: params[:description]
    })
    redirect_to faction_strategies_path(params[:faction_id])
  end

  def update
    strat = Strategy.find(params[:id])
    strat.update({
      user_id: current_user.id,
      faction_id: params[:faction_id],
      turn: params[:turn],
      description: params[:description]
    })

    redirect_to faction_strategies_path(params[:faction_id])
  end

  def destroy
    strat = Strategy.find(params[:id])
    strat.destroy

    redirect_to faction_strategies_path(params[:faction_id])
  end
end
