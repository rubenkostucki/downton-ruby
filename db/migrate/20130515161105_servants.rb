class Servants < ActiveRecord::Migration
  def change
    create_table :servants do |t|
      t.string :last_name
      t.string :occupation
      t.integer :date
    end
  end
end
