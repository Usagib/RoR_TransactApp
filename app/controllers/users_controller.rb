class UsersController < ApplicationController
  before_action :set_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      remember @user
      flash.now[:sucess] = 'The user has been created'
      redirect_to root_url
    else
      render 'new'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
