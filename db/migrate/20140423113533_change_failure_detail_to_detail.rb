class ChangeFailureDetailToDetail < ActiveRecord::Migration
  def up
    rename_column :histories, :failure_detail, :detail
  end

  def down
    rename_column :histories, :detail, :failure_detail
  end
end
