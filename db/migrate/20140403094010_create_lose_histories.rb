class CreateLoseHistories < ActiveRecord::Migration
  def change
    create_table :lose_histories do |t|

      t.timestamps
    end
  end
end
