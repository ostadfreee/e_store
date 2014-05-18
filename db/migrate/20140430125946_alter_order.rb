class AlterOrder < ActiveRecord::Migration
  def up
  	change_column("orders", "name", :string, :limit => 25)
    change_column("orders", "order_date", :datetime)
  	add_column("orders", "customer_id", :integer)
  	add_index("orders", "customer_id")
  	add_index("orders","order_number")
  	
  end
  def down 
  	remove_index("orders", "order_number")
  	remove_index("orders", "customer_id")
  	remove_column("orders", "customer_id", :integer)
    change_column("orders", "order_date", :date)
  	change_column("orders", "name", :string)
  end
  	
end
