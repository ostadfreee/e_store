class Product < ActiveRecord::Base
	belongs_to :order
	belongs_to :category
	has_and_belongs_to_many :customers
	has_many :line_items

	#CONTENT_TYPES = ['text', 'HTML']
	validates_presence_of :price, :unite, :category_id
	validates :name, :presence => true,
                         :length => { :maximum => 25 }
    validates :product_content, :presence => true,
                        :length => { :maximum => 50 }
    #validates_inclusion_of :product_content, :in => CONTENT_TYPES,
    #:message => "must be one of: #{CONTENT_TYPES.join(', ')}"
    
    validates_presence_of :product_content
   
	scope :sorted, lambda { order("products.name ASC") }
end
