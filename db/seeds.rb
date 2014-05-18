# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include Faker 
Customer.delete_all
50.times do 
a= Customer.create(:first_name => Name.first_name ,:last_name => Name.last_name, :email=> Internet.email, 
	:address=> Address.country, :birthday => Time.now, :customer_number=> ((rand *100).to_i))
end
Order.delete_all
50.times do 
b= Order.create(:name => Lorem.word ,:order_number=> (Number.digit.to_i), :order_date => Time.now, :sum=> Commerce.price, :customer_id => Number.digit.to_i)
end
Product.delete_all
r = %w{thumbnail.jpg thumbnail(1).jpg thumbnail(2).jpg thumbnail(3).jpg thumbnail(4).jpg thumbnail(5).jpg
thumbnail(6).jpg thumbnail(7).jpg thumbnail(8).jpg thumbnail(9).jpg thumbnail(10).jpg}
50.times do 
c= Product.create(:name => Commerce.product_name ,:product_serial => Number.digit.to_i, :price=> Commerce.price.to_d,
	:unite=> Number.digit.to_i, :product_content=> Lorem.paragraph, :category_id => Number.digit.to_i,
	:image_path => r.sample)
end
Category.delete_all
50.times do 
d= Category.create(:name => Company.name)
end
User.delete_all
50.times do 
e= User.create(:username => Internet.user_name, :first_name => Name.first_name ,:last_name => Name.last_name,
:email=> Internet.email, :password => Internet.password )
end
