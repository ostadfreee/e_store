class Category < ActiveRecord::Base
	has_many :products
    validates_presence_of :name 
    validates_length_of :name , :maximum => 255
	scope :sorted, lambda { order("categories.name ASC") }
end
