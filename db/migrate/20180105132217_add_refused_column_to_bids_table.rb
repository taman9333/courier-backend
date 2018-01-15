class AddRefusedColumnToBidsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :bids, :refused, :boolean, default: false
  end
end
