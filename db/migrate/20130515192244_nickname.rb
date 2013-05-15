class Nickname < ActiveRecord::Migration
  def change
    add_column :servants, :nickname, :string
  end
end
