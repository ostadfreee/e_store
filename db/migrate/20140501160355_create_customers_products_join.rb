class CreateCustomersProductsJoin < ActiveRecord::Migration
  def up 
    create_table :customers_products,:id=> false do |t|
    	t.integer "customer_id"
    	t.integer "product_id"
    end
    add_index :customers_products, ["customer_id", "product_id" ]
  end
  def down 
  	drop_table :customers_products
  end
end
