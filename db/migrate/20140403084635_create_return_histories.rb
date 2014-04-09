class CreateReturnHistories < ActiveRecord::Migration
  def change
    create_table :return_histories do |t|

      t.timestamps
    end
  end
end
