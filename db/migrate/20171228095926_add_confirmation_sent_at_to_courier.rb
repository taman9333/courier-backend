class AddConfirmationSentAtToCourier < ActiveRecord::Migration[5.1]
  def change
    add_column :couriers, :confirmation_sent_at, :date
  end
end

