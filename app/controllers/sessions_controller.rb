class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by("LOWER(users.username) LIKE LOWER('%#{params[:username]}%')")
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.username}!"

      redirect_to '/'
    else
      flash[:alert] = 'Sorry, no matching account.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to '/'
  end
end
