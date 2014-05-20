class AlterProduct < ActiveRecord::Migration
  def up
  	change_column("products", "name", :string, :limit => 50)
    add_column("products","category_id",:integer)
    add_column("products","image_path",:string)
  end
  def down 
    remove_column("products","image_path",:string)
    remove_column("products","category_id",:integer)
  	change_column("products", "name", :string)
  	 end

end
