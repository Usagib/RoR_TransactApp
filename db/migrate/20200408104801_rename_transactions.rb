class RenameTransactions < ActiveRecord::Migration[5.2]
  def change
    rename_table :transactions, :mytransactions
  end
end
