class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :attachments
      t.integer :lending_period
      t.integer :category
      t.text :place
      t.integer :amount
      t.boolean :trashed
      t.text :picture_path

      t.timestamps
    end
  end
end
