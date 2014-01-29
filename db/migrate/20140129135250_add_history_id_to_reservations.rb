class AddHistoryIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :history_id, :integer
  end
end
