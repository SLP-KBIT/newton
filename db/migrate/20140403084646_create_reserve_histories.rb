class CreateReserveHistories < ActiveRecord::Migration
  def change
    create_table :reserve_histories do |t|

      t.timestamps
    end
  end
end
