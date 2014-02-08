class AddDetailsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :team_number, :integer
    add_column :teams, :nickname, :string
    add_column :teams, :name, :string
    add_column :teams, :key, :string
    add_column :teams, :website, :string
    add_column :teams, :locality, :string
    add_column :teams, :region, :string
    add_column :teams, :country_name, :string
    add_column :teams, :location, :string
    add_column :teams, :events, :string, array: true, default: '{}' 
  end
end
