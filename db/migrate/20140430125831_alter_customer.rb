class AlterCustomer < ActiveRecord::Migration
  def up
  	change_column("customers", "first_name", :string, :limit => 25)
  	change_column("customers", "last_name", :string, :limit => 50)
  	change_column("customers", "email", :string, :default=> "", :null => :false)
  	change_column("customers", "address", :string, :limit => 100)
    rename_column("customers", "custome_number","customer_number")

   end
   def down 
    rename_column("customers", "customer_number","custome_number")
   	change_column("customers", "address", :string)
   	change_column("customers", "email", :string)
   	change_column("customers", "last_name", :string)
   	change_column("customers", "first_name", :string)
   end



end
