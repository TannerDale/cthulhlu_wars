class Admin::GameDaysController < Admin::BaseController
  def create
    day = GameDay.new({
      day: params[:day]
    })
    if day.save
      flash[:success] = 'Day Added!'
    else
      flash[:danger] = 'Invalid Date'
    end

    redirect_to admin_dashboard_path
  end

  def destroy
    GameDay.destroy(params[:id])

    flash[:alert] = 'Date Removed'
    redirect_to admin_dashboard_path
  end
end
