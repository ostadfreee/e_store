class AlterOrder < ActiveRecord::Migration
  def up
  	change_column("orders", "name", :string, :limit => 25)
    change_column("orders", "order_date", :datetime)
  	add_column("orders", "customer_id", :integer)
  	add_index("orders", "customer_id")
    remove_column("orders", "name", :string,:limit => 25)
    add_column("orders", "quantity_of_product",:string, :array => true , :defailt => []) 
    add_column("orders", "quantity", :integer)
    add_column("orders", "products", :string)
    remove_column("orders", "order_number",:integer)
    add_column("orders","order_number",:string)
    remove_column("orders","products", :string)
    add_column("orders","list_of_products",:string, :array=> true, :default => [])
    add_index("orders","order_number")
  end
  def down
    remove_index("orders","order_number")
    remove_column("orders","list_of_products",:string, :array => true , :default => [])
    add_column("orders","products", :string)
    remove_column("orders", "order_number", :string)
    add_column("orders","order_number",:integer)
    remove_column("orders", "products",:string)
    remove_column("orders", "quantity",:integer)
    remove_column("orders", "quantity_of_product",:string, :array => true, :default=>[])
    add_column("orders", "name",:string,:limit => 25)    
  	remove_index("orders", "customer_id")
  	remove_column("orders", "customer_id", :integer)
    change_column("orders", "order_date", :date)
  	change_column("orders", "name", :string)
  end
  	
end
