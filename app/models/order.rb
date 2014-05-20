class Order < ActiveRecord::Base
	belongs_to :customer
	has_many :line_items
	has_many :products, :through => :line_items
    #validates :name, :presence => true,
                         #:length => { :maximum => 25 }
   
end
