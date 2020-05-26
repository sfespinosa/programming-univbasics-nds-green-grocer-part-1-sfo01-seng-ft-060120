require 'pry'

def find_item_by_name_in_collection(item, shelf)
  returned_item = nil
  shelf.each do |item_hash|
    item_hash.each do |item_name, item_details|
      if item_details == item 
        returned_item = item_hash
      end 
    end 
  end 
  returned_item
end 

def consolidate_cart(cart)
  new_cart = []
  cart.each do |cart_item|
    new_cart_item = find_item_by_name_in_collection(cart_item[:item], new_cart)
    binding.pry
      if new_cart_item != nil 
        new_cart_item[:count] += 1 
      else 
        new_cart_item = {
          :item => cart_item[:item],
          :price => cart_item[:price],
          :clearance => cart_item[:clearance],
          :count => 1 
        }
        binding.pry
        new_cart << new_cart_item
      end 
  end 
  new_cart
end
