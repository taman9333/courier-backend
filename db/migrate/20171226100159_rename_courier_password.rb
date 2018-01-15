class RenameCourierPassword < ActiveRecord::Migration[5.1]
  def change
  	rename_column :couriers, :hashed_password, :password_digest
  end
end
