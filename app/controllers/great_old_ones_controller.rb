class GreatOldOnesController < ApplicationController
  def index
    @great_old_ones = GreatOldOne.ordered
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
    @old_one = GreatOldOne.find(params[:id])
  end

  def destroy
  end
end
