class AddTransactionIdToGroup < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :transaction, foreign_key: true
  end
end
