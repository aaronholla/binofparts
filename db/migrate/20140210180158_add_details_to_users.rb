class AddDetailsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.belongs_to :team
      t.string     :first_name
      t.string     :last_name
    end
  end
end
