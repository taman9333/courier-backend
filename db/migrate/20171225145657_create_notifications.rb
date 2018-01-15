class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
    	t.text :body
    	t.belongs_to :user, :polymorphic => true
      t.timestamps
    end
  end
end
