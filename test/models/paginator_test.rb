require 'test_helper'

class PaginatorTest < ActiveSupport::TestCase

  ITEMS = [9,8,7,6,5,4,3,2,1,0]

  def test_page_count
    assert_equal(4, Paginator.new(ITEMS, 3).page_count )
    assert_equal(5, Paginator.new(ITEMS, 2).page_count )
    assert_equal(2, Paginator.new(ITEMS, 6).page_count )
    assert_equal(2, Paginator.new(ITEMS, 5).page_count )
  end

  def test_item_count
    assert_equal(10, Paginator.new(ITEMS, 5).item_count )
  end

  def test_page_item_count
    assert_equal(3, Paginator.new(ITEMS, 3).page_item_count(1) )
    assert_equal(3, Paginator.new(ITEMS, 3).page_item_count(2) )
    assert_equal(3, Paginator.new(ITEMS, 3).page_item_count(3) )
    assert_equal(3, Paginator.new(ITEMS, 3).page_item_count(1) )
    assert_equal(-1, Paginator.new(ITEMS, 3).page_item_count(5) )
  end

  def test_page_index
    assert_equal(1, Paginator.new(ITEMS, 3).page_index(2) )
    assert_equal(2, Paginator.new(ITEMS, 3).page_index(4) )
    assert_equal(3, Paginator.new(ITEMS, 3).page_index(7) )
    assert_equal(4, Paginator.new(ITEMS, 3).page_index(9) )
    assert_equal(-1, Paginator.new(ITEMS, 3).page_index(20) )
    assert_equal(-1, Paginator.new(ITEMS, 3).page_index(-3) )
  end
end