class CreateLendHistories < ActiveRecord::Migration
  def change
    create_table :lend_histories do |t|

      t.timestamps
    end
  end
end
