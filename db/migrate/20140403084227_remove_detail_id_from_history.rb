class RemoveDetailIdFromHistory < ActiveRecord::Migration
  def change
    remove_column :histories, :detail_id, :integer
  end
end
