class AddUserToCovid < ActiveRecord::Migration[5.2]
  def change
    add_reference :covids, :user, foreign_key: true
  end
end
