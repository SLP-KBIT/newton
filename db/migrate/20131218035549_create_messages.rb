class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :contents
      t.string :from
      t.boolean :read_flag
      t.integer :user_id

      t.timestamps
    end
  end
end
