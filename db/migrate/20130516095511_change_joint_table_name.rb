class ChangeJointTableName < ActiveRecord::Migration
  def change
    rename_table(:aristocratsclubs, :aristocrats_clubs)
  end
end
