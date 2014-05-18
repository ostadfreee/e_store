class Basket
    attr_reader :items
    attr_reader :total_price

    def initialize 
        empty_all_items 
     end 
     def empty_all_items 
        @items = []
        @total_price = 0.0
    end
     def add_product(product)
        existing_item = @items.find {|item| item.product_id == product.id}
        if existing_item 
            existing_item.quantity += 1
        else 
     	@items << LineItem.new_based_on(product)
     end 
     	@total_price += product.price.to_d
     end
     def remove_product(product)
        existing_item = @items.find {|item| item.product_id == product.id}
        if existing_item && existing_item.quantity > 1 
            existing_item.quantity -= 1
        else 
            @items.delete(existing_item)
        end
        @total_price -= product.price.to_d
    end
end