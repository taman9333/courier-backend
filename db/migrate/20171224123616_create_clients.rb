class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :username
      t.string :email
      t.string :img
      t.string :phone
      t.string :hashed_password

      t.timestamps
    end
  end
end
