class AddClientConfirmationToken < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :confirmation_token , :string
    add_column :clients, :confirmed_at, :date
  end
end
