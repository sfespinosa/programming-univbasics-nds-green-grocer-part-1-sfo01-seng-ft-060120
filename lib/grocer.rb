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
  cart.each do |item_hash|
    main_item = find_item_by_name_in_collection(item_hash[:item], new_cart)
    binding.pry
      if main_item 
        main_item[:count] += 1 
      else 
        item_hash[:count] = 1 
        new_cart << item_hash
      end 
  end 
end