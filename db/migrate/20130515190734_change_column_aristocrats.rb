class ChangeColumnAristocrats < ActiveRecord::Migration
  def change
    rename_column :aristocrats, :last_name, :surname
  end
end
