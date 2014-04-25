class CreateDestroyHistories < ActiveRecord::Migration
  def change
    create_table :destroy_histories do |t|

      t.timestamps
    end
  end
end
