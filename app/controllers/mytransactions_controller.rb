class MytransactionsController < ApplicationController
  before_action :logged_in_user
  skip_before_action :verify_authenticity_token

  def new
    @mytransaction = Mytransaction.new
  end

  def create
    @mytransaction = @current_user.mytransactions.new(mytransaction_params)
    if @mytransaction.save
      flash.now[:sucess] = 'transaction created'
      redirect_to mytransactions_path
    else
      render 'new'
    end
  end

  def index
    @mytransactions = @current_user.mytransactions.includes(:group)
  end

  def external
    @mytransactions = @current_user.mytransactions.includes(:group)
  end

  def logged_in_user
    store_location
    redirect_to login_path unless logged_in?
    flash[:danger] = 'Please log in.' unless logged_in?
  end

private
  def mytransaction_params
    params.require(:mytransaction).permit(:name, :amount, :group_id)
  end
end
