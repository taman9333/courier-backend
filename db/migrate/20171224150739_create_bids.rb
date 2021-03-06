class CreateBids < ActiveRecord::Migration[5.1]
  def change
    create_table :bids do |t|
      t.decimal :price
      t.references :courier, index: true, foreign_key: true
      t.references :auction, index: true, foreign_key: true

      t.timestamps
    end
  end
end
