class ChangeConfirmationDateType < ActiveRecord::Migration[5.1]
  def change
    change_column :couriers, :confirmed_at, :datetime
    change_column :couriers, :confirmation_sent_at, :datetime
  end
end
