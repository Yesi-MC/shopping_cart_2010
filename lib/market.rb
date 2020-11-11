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
end