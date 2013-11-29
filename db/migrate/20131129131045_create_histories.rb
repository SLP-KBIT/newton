class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :status
      t.integer :amount
      t.text :failure_detail
      t.integer :detail_id

      t.timestamps
    end
  end
end
