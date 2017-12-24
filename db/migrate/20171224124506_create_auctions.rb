class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.date :bid_deadline
      t.string :status

      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
