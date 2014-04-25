class CreateRestoreHistories < ActiveRecord::Migration
  def change
    create_table :restore_histories do |t|

      t.timestamps
    end
  end
end
