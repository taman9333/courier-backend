class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :category
      t.decimal :weight
      t.string :dimentions
      t.date :delivery_date
      t.references :client, foreign_key: true
      t.references :pickup_address, foreign_key: { to_table: :addresses }
      t.references :drop_off_address, foreign_key: { to_table: :addresses }
      # t.references :billing_address, foreign_key: { to_table: :addresses }
      t.string :billing_address

      t.timestamps
    end
  end
end
