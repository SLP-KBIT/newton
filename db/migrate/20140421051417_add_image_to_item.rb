class AddImageToItem < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.remove :picture_path
      t.string :image
    end
  end
end
