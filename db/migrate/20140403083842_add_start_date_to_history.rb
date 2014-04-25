class AddStartDateToHistory < ActiveRecord::Migration
  def change
    add_column :histories, :start_date, :timestamp
  end
end
