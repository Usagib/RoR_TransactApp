module TransactionHelper

  def total_amount
    total = 0
    @current_user.transactions.each do |t|
      total += t.amount
    end
    return total
  end
end
