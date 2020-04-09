class RenameTransactionidOnGroup < ActiveRecord::Migration[5.2]
  def change
    rename_column :groups, :transaction_id, :mytransaction_id
  end
end
