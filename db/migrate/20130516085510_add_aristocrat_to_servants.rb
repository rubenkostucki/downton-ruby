class AddAristocratToServants < ActiveRecord::Migration
  def change
    add_column :servants, :aristocrat_id, :integer
    add_index :servants, :aristocrat_id
  end
end
