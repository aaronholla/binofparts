class RemoveColumnsFromRequests < ActiveRecord::Migration
  def change
  	remove_column :requests, :event
  	remove_column :requests, :team
  end
end
