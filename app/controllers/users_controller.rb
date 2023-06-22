class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save # If the user is successfully saved to the database
      redirect_to new_user_path # Redirect to the new user page
    else
      render :new, status: :unprocessable_entity # Render the new user page
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params) # If the user is successfully updated in the database
      redirect_to users_path # Redirect to the user page
    else
      render :edit, status: :unprocessable_entity # Render the edit user page
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
