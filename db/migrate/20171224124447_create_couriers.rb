class CreateCouriers < ActiveRecord::Migration[5.1]
  def change
    create_table :couriers do |t|
      t.string :username
      t.string :email
      t.string :hashed_password
      t.string :img
      t.string :phone

      t.timestamps
    end
  end
end
