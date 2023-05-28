class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :gender
      t.date :date_of_birth
      t.integer :citizen_it, null: false
      t.text :address
      t.string :contact_number

      t.timestamps
    end
  end
end
