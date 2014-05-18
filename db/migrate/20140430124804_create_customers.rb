class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.date :birthday
      t.integer :custome_number

      t.timestamps
    end
  end
   def down 
    drop_table :customers
  end
end
