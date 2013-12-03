class RenameLendebleToUsers < ActiveRecord::Migration
  def up
    rename_column :users, :lendeble, :lendable
  end

  def down
    rename_column :users, :lendable, :lendeble
  end
end
