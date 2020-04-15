class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      remember(@user)
      flash.now[:success] = 'The user has been created'
      redirect_to(mytransactions_path)
    else
      render('new')
    end
  end

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def set_user
    @user = User.find(params[:id])
  end

end
