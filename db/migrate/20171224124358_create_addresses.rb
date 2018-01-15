class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
    	t.integer :apartment_number
    	t.integer :building_number
      t.string :street
      t.string :area
      t.boolean :saved, default: false
      t.references :client,  index: true, foreign_key: true


      t.timestamps
    end
  end
end
