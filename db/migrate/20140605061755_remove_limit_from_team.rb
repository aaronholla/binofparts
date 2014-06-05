class RemoveLimitFromTeam < ActiveRecord::Migration
  def change
  	change_column :teams, :events, :text, :limit => nil
  end
end
