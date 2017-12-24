class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.smallint :rating
      t.text :review
      t.string :status
      t.references :order, foreign_key: true
      t.references :courier, foreign_key: true

      t.timestamps
    end
  end
end
