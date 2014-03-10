class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
     t.integer :part_id
     t.integer :qty
     t.integer :event_id
     t.integer :team_id
     t.boolean :accepted
     t.integer :accepted_by
     t.datetime :accepted_at
     t.timestamps
    end
  end
end
