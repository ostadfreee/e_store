class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
    	t.string "username", :limit => 25
    	t.string "first_name", :limit => 40
    	t.string "last_name", :linit => 50
    	t.string "email" , :default => "", :null => false 
    	t.string "password" , :limit => 40
      t.timestamps
    end
  end
  def down 
  	drop_table :users
  end
end
