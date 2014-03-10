class AddIndexToRequests < ActiveRecord::Migration
  def change
  	add_index :requests, :part_id
  	add_index :requests, :event_id
  	add_index :requests, :team_id
  end
end
