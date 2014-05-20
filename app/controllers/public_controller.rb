class PublicController < ApplicationController
	before_filter :find_or_create_basket, :except => [:list]
  before_filter :get_all_categories, :except => [:remove_from_basket, :empty_basket]
  add_breadcrumb "Home", :list_path

  layout 'public'  
  def  list
    @products = Product.sorted.paginate(:per_page => 5 , :page => params[:page])
    add_breadcrumb "Products", products_path



  end

 def add_to_basket 
  product = Product.find(params[:id])
  @basket.add_product(product)
  flash[:notice] = "Product succesfully added."
  redirect_to(:action => 'show_basket')

end
def show_basket
  add_breadcrumb "Show Basket", show_path
end
def remove_from_basket
   product = Product.find(params[:id])
   @basket.remove_product(product)
   flash[:notice] = "Product succesfully removed."
   redirect_to(:action=> 'show_basket')
 end
 def empty_basket
  @basket.empty_all_items
  flash[:notice] = "Basket succesfully is emptied."
  redirect_to(:action => 'list')
 end
 def checkout 
  @customer = Customer.new
  #@cart = Cart.new
  add_breadcrumb "Checkout", check_path
 end
 def save_order
  @customer = Customer.new(params.require(:customer).permit(:first_name, :last_name, :email, :address, :birthday, :customer_number))
  @order = Order.new

  @order.line_items << @basket.items
  @customer.orders << @order 
    if @customer.save 
       @basket.empty_all_items
       redirect_to(:action => 'show_receipt', :id => @order.id)
       flash[:notice] = "Customer succesfully created"
    else 
     flash[:notice] = "Please enter a valid FIRST NAME, LAST NAME or EMAIL" 
     render(:action => 'checkout')
  #@cart = Cart.new(params[:cart])
 end
 end
 def show_receipt 
  @order = Order.find(params[:id])
  @order.sum = 0.0
  @order.quantity = 0
  @order.order_number = "#"+Time.now.strftime("%d%m%y")+"-"+(@order.id).to_s+"-"+(rand(29)*100).to_s
  @order.order_date = Time.now
  @order.line_items.each do |item|
     @order.products << Product.find(item.product_id)
     @order.sum += (item.quantity*item.price).to_d
     @order.quantity += item.quantity
      end 
      @order.products.each do |product|
      @order.list_of_products << product.name
      end
     @order.save      
      end 
 def list_product
  @category = Category.find(params[:id])
  @products = @category.products.paginate(:per_page => 5 , :page => params[:page])
  add_breadcrumb "Category", list_path
  add_breadcrumb @category.name, category_path


 end 
 def show_product
  @product = Product.find(params[:id])
  add_breadcrumb "Products", list_path
  add_breadcrumb @product.name, product_path


end 




private 
def find_or_create_basket
  @basket = session[:basket] ||= Basket.new
end
def get_all_categories
  @categories = Category.all
end

end 
