class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :part_id
      t.integer :year
      t.integer :qty
      t.integer :event_id
      t.integer :team_id

      t.timestamps
    end
  end
end
