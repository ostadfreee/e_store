include Faker 
include RandomData
Customer.delete_all
50.times do 
customer =  Customer.create(
	       :first_name => Random.first_name ,
	       :last_name => Random.last_name,
	       :email=> Random.email, 
	       :address=> Random.address_line_1,
	       :birthday => Array(Date.new(2000,1,1)..Date.today).sample,
	       :customer_number=> Random.number(1..100))
end

Category.delete_all
50.times do 
category = Category.create(
	       :name => Random.companyname)
end

Product.delete_all
Product.delete_all
r = %w{thumbnail.jpg thumbnail(1).jpg thumbnail(2).jpg thumbnail(3).jpg thumbnail(4).jpg thumbnail(5).jpg
thumbnail(6).jpg thumbnail(7).jpg thumbnail(8).jpg thumbnail(9).jpg thumbnail(10).jpg}
50.times do 
	      :name => Commerce.product_name,
	      :product_serial => Random.number(1000..5000),
	      :price=> Commerce.price.to_d,
	      :unite=> Random.number(100..1000),
	      :product_content=> Lorem.paragraph,
	      :category_id => Random.number(1..100),
	      :image_path => r.sample)
end
Order.delete_all
50.times do 
order = Order.create(
	    :order_number=> Random.number(1..5000).to_s,
	    :order_date => Array(Date.new(2000,1,1)..Date.today).sample,
	    :sum=> Commerce.price)
end
User.delete_all
50.times do 
user = User.create(
	   :username => Internet.user_name,
	   :first_name => Name.first_name ,
	   :last_name => Name.last_name,
       :email=> Internet.email,
       :password => Internet.password)










