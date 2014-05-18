class Cart 
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  attr_accessor :credit_number, :credit_pin, :credit_date
  validates_presence_of :credit_number
  validates_presence_of :credit_pin
  validates_presence_of :credit_date
  
   def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
end
