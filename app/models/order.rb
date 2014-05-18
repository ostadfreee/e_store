class Order < ActiveRecord::Base
	belongs_to :customer
	has_many :products
	has_many :line_items
    #validates :name, :presence => true,
                         #:length => { :maximum => 25 }
   
end
