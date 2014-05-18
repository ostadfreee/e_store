class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :name
      t.integer :product_serial
      t.decimal :price
      t.decimal :discount
      t.integer :unite
      t.text :product_content

      t.timestamps
    end
    end

  def down 
    drop_table :products
  end
end
