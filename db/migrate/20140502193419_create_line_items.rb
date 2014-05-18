class CreateLineItems < ActiveRecord::Migration
  def up 
    create_table :line_items do |t|
    	t.integer "order_id"
    	t.integer "product_id"
    	t.integer "quantity"
    	t.decimal "price"

      t.timestamps
    end
    add_index :line_items , ["order_id", "product_id"]
  end
  def down 
  	drop_table :line_items
  end
end
