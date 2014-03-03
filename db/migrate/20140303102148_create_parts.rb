class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
		t.string  :name
		t.string  :description
		t.string  :number
		t.integer :qty
		t.string  :category
		t.string  :picture
		t.string  :year
		
      	t.timestamps
    end
  end
end
