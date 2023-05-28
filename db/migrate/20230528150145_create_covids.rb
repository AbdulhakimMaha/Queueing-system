class CreateCovids < ActiveRecord::Migration[5.2]
  def change
    create_table :covids do |t|
      t.date :test_date
      t.date :actual_test_date
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
