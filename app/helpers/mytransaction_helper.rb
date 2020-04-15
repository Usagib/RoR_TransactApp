module MytransactionHelper
  def total_group_amount
    total = 0
    @current_user.mytransactions.grouped.each do |t|
      total += t.amount
    end
    total
  end

  def total_ungrouped_amount
    total = 0
    @current_user.mytransactions.ungrouped.each do |t|
      total += t.amount
    end
    total
  end
end
