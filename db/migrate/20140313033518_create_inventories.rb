class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :part_id
      t.integer :event_id
      t.integer :qty
      t.timestamps
    end
  end
end
