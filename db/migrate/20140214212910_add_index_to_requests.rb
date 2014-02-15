class AddIndexToRequests < ActiveRecord::Migration
  def change
  	add_index :requests, :team_id
  end
end
