class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.integer :rating
      t.text :review
      t.string :status
      t.references :order, index: true, foreign_key: true
      t.references :courier, index: true, foreign_key: true

      t.timestamps
    end
  end
end
