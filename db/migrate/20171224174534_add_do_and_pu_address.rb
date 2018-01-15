class AddDoAndPuAddress < ActiveRecord::Migration[5.1]
  def change
  	add_reference :orders, :pickup_address, foreign_key: {to_table: :addresses}, index: true
  	add_reference :orders, :drop_off_address, foreign_key: {to_table: :addresses},  index: true
  	# t.references :pickup_address, foreign_key: { to_table: :addresses }
   #  t.references :drop_off_address, foreign_key: { to_table: :addresses }
  end
end
