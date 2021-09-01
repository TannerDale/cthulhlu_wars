class UsersController < ApplicationController
  def index
  end

  def new
    if !session[:validated]
      flash[:alert] = 'You must join the team before creating an account'
      redirect_to root_path
    end
  end

  def create
    new_user = User.create(user_params)
    if new_user.validate && session[:validated]
      flash[:success] = "Welcome #{new_user.username}!"
      session[:user_id] = new_user.id

      redirect_to root_path
    else
      flash[:alert] = 'Invalid loggin.'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    @user = current_user
  end

  def destroy
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
