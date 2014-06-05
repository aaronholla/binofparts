class TeamNameToText < ActiveRecord::Migration
  def change
  	change_column :teams, :name, :text, :limit => nil
  end
end
