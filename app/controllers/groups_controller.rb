class GroupsController < ApplicationController
  before_action :logged_in_user

  def new
    @group = Group.new
  end

  def create
    @group = @current_user.groups.new(group_params)
  end

private
  def group_params
    params.require(:groups).permit(:name, :icon, :created_at)
  end
end
