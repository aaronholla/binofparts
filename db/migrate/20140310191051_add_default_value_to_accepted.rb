class AddDefaultValueToAccepted < ActiveRecord::Migration
  def change
  	change_column :requests, :accepted, :boolean, :default => false
  end
end
