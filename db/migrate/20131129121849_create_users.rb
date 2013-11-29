class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :account
      t.boolean :admin_flag
      t.integer :category
      t.boolean :lendeble
      t.string :e_mail
      t.string :password

      t.timestamps
    end
  end
end
