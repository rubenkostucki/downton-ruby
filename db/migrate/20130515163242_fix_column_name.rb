class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :servants, :date, :age
  end
end
