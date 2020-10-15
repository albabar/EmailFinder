class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.find_or_initialize_by(user_params)
    unless user.persisted?
      user.email = ValidEmailFinder.new(user_params[:first_name], user_params[:last_name], user_params[:domain]).find!
      user.save
    end

    if user.persisted?
      redirect_to user_path(user), notice: "Email address found!"
    else
      redirect_to root_path, notice: "Could not determine a valid email address!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :domain)
  end
end
