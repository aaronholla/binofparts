class AddAssociationsToUsersAndTeams < ActiveRecord::Migration
  def change
  	add_index :teams, :team_number,                :unique => true
  end
end
