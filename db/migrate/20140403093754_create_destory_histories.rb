class CreateDestoryHistories < ActiveRecord::Migration
  def change
    create_table :destory_histories do |t|

      t.timestamps
    end
  end
end
