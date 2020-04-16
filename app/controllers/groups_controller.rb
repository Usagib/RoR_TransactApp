class GroupsController < ApplicationController
  before_action :set_group, only: %i[show]
  before_action :logged_in_user
  skip_before_action :verify_authenticity_token

  def new
    @group = Group.new
  end

  def create
    @group = @current_user.groups.new(group_params)
    if @group.save
      flash.now[:sucess] = 'group created'
      redirect_to(groups_path)
    else
      render('new')
    end
  end

  def show; end

  def index
    @groups = Group.ordered
  end

  def logged_in_user
    store_location
    redirect_to(login_path) unless logged_in?
    flash[:danger] = 'Please log in.' unless logged_in?
  end

  private

  def group_params
    params.require(:group).permit(:name, :picture)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
