class AddAssociationForTeamToUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :team_id, :team_number_id
  end
end
