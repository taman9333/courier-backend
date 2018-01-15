class AddCourierConfirmationToken < ActiveRecord::Migration[5.1]
  def change
  	add_column :couriers, :confirmation_token, :string
  	add_column :couriers, :confirmed_at, :date
  end
end
