class RemoveStatusFromHistory < ActiveRecord::Migration
  def change
    remove_column :histories, :status, :integer
  end
end
