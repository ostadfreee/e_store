class CreateOrders < ActiveRecord::Migration
  def up
    create_table :orders do |t|
      t.string :name
      t.integer :order_number
      t.date :order_date
      t.decimal :sum

      t.timestamps
    end
     end
   def down 
    drop_table :orders
  end
end
