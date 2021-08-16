class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    new_user = User.create(user_params)
    if new_user.validate
      flash[:success] = "Welcome #{new_user.username}"
      session[:user_id] = new_user.id

      redirect_to '/'
    else
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
