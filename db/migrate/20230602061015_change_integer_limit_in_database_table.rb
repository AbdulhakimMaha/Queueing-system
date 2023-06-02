class ChangeIntegerLimitInDatabaseTable < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :citizen_id, :integer, limit: 8
  end
end
