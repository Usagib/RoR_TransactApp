class DropTransactionIdFromGroup < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :transaction_id
  end
end
