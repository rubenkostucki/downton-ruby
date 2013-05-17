class AddAristocratsClubsTable < ActiveRecord::Migration
  def change
    create_table :aristocratsclubs do |x|
      x.integer :aristocrat_id
      x.integer :club_id
    end
  end
end
