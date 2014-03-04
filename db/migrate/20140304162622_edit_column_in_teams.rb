class EditColumnInTeams < ActiveRecord::Migration
  def change
  	 change_column :teams, :events, :text
  end
end
