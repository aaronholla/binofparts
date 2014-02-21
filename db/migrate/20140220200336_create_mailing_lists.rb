class CreateMailingLists < ActiveRecord::Migration
  def change
    create_table :mailing_lists do |t|
    	t.string :email
    	t.string :first_name
    	t.string :last_name
    	t.integer :team

    	t.timestamps
    end
    drop_table :mailing_list
  end
end
