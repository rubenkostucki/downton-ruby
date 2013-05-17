class AddIndexToJointTable < ActiveRecord::Migration
  def change
    add_index(:aristocratsclubs, :aristocrat_id)
    add_index(:aristocratsclubs, :club_id)
  end
end
