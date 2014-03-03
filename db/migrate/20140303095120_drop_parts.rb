class DropParts < ActiveRecord::Migration
  def change
  	drop_table :parts
  end
end
