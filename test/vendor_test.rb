require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/vendor'


class VendorTest < Minitest::Test
  def test_it_exists_and_has_attributes
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_instance_of Vendor, vendor
    assert_equal "Rocky Mountain Fresh", vendor.name
  end

  def test_it_starts_with_no_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")

    expected = {}

    assert_equal expected, vendor.inventory
  end

  def test_it_can_check_stock
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    assert_equal 0, vendor.check_stock(item1)
  end
end
