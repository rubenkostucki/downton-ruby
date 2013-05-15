class Aristocrats < ActiveRecord::Migration
  def change
    create_table :aristocrats do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
    end
  end
end
