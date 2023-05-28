class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :citizen_it, :citizen_id 
  end
end
