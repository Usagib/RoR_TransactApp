class ChangeColumnIconidToPicture < ActiveRecord::Migration[5.2]
  def change
    rename_column :groups, :icon, :picture
  end
end
