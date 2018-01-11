class AddColumnToNotification < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :check, :boolean, :default => false
  end
end
