class AddReferencesToRequests < ActiveRecord::Migration
  def change
  	add_column :requests, :event, :integer
  	add_column :requests, :team, :integer

  	add_index :requests, :event_id
  end
end
