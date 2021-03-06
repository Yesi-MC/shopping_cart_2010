class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(items)
    sell =[]
    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        if items == item.first
          sell << vendor
        end
      end
    end
    sell
  end

  def total_inventory
    inventory = Hash.new
    @vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
        inventory[item] = {quantity: 0, vendors: []} if inventory[item].nil?
          inventory[item][:quantity] += vendor.inventory[item]
          inventory[item][:vendors] << vendor
        end
      end
    inventory
  end

  def overstocked_items
    overstock = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
        if vendors_that_sell(item).count > 1 && amount > 50
          overstock << item
        end
      end
    end
    overstock
  end

  def sorted_item_list
    @vendors.map do |vendor|
       vendor.inventory.map do |item, amount|
         item.name
       end
     end.flatten.uniq.sort
  end
end
