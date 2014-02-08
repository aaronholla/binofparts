class AddDetailsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :key, :string
    add_column :events, :name, :string
    add_column :events, :short_name, :string
    add_column :events, :start_date, :datetime
    add_column :events, :end_date, :datetime
    add_column :events, :official, :boolean
  end
end
