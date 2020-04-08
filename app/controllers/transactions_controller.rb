class TransactionsController < ApplicationController
  before_action :logged_in_user

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = @current_user.transactions.new(transaction_params)
    if @transaction.save
      flash.now[:sucess] = 'transaction created'
      redirect_to transactions_path
    else
      render 'new'
    end
  end

  def index
    @transactions = Transaction.all
  end

  def logged_in_user
    store_location
    redirect_to login_path unless logged_in?
    flash[:danger] = 'Please log in.' unless logged_in?
  end

private
  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end
end
