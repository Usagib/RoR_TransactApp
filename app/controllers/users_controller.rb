class UsersController < ApplicationController
  before_action :set_user, only: %i[update edit destroy show]
  before_action :correct_user, only: %i[edit update]
  skip_before_action :verify_authenticity_token

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      remember @user
      flash.now[:success] = 'The user has been created'
      redirect_to mytransactions_path
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'User updated succesfully!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user_check(@user)
    flash[:danger] = 'Cannot edit other user!' unless current_user_check(@user)
  end
end
