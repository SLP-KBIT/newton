class FixUsersToMutchDevise < ActiveRecord::Migration
  def change
    rename_column :users, :account, :uid
    remove_column :users, :password_digest
  end
end
