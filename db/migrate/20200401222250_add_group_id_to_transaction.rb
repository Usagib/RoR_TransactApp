class AddGroupIdToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :group, foreign_key: true
  end
end
