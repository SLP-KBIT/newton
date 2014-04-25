class AddTypeToHistory < ActiveRecord::Migration
  def change
    add_column :histories, :type, :string
  end
end
