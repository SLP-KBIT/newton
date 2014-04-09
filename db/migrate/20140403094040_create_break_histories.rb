class CreateBreakHistories < ActiveRecord::Migration
  def change
    create_table :break_histories do |t|

      t.timestamps
    end
  end
end
