class RenameColumnPasswordInClient < ActiveRecord::Migration[5.1]
  def change
    rename_column :clients, :hashed_password, :password_digest
  end
end
