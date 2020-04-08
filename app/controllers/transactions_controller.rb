class TransactionsController < ApplicationController
  before_action :logged_in_user

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = @current_user.transactions.new(transaction_params)
  end

private
  def transaction_params
    params.require(:transactions).permit(:name, :amount, :created_at)
  end
end
