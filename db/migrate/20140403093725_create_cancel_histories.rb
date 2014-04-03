class CreateCancelHistories < ActiveRecord::Migration
  def change
    create_table :cancel_histories do |t|

      t.timestamps
    end
  end
end
