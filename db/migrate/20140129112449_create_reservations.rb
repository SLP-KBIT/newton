class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :start_date

      t.timestamps
    end
  end
end
