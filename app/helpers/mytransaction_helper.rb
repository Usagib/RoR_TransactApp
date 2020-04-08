module MytransactionHelper

  def total_group_amount
    total = 0
    @current_user.mytransactions.each do |t|
      total += t.amount if t.group?
    end
    return total
  end

  def total_ungrouped_amount
    total = 0
    @current_user.mytransactions.each do |t|
      total += t.amount if !t.group?
    end
    return total
  end
end
