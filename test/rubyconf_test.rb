require 'minitest/autorun'
require 'set'
require './lib/rubyconf'

class TestRubyconf < Minitest::Test

  def setup
    @rubyconf = Rubyconf.new
    @enum     = [1, 2, 3, 4, 5]
  end

  def test_return_first_n_elements
    assert_equal [1, 2, 3], @rubyconf.return_first_n_elements(@enum, 3)
  end

  def test_square_each_element
    assert_equal [1, 4, 9, 16, 25],
                 @rubyconf.square_each_element(@enum)
  end

  def test_any_are_odd
    assert  @rubyconf.any_are_odd(@enum)
    assert !@rubyconf.any_are_odd([2, 4, 6])
  end

  def test_all_are_odd
    assert !@rubyconf.all_are_odd(@enum)
    assert  @rubyconf.all_are_odd([1, 3, 5])
  end

  def test_none_are_odd
    assert !@rubyconf.none_are_odd(@enum)
    assert  @rubyconf.none_are_odd([2, 4, 6])
  end

  def test_find_evens
    assert_equal [2, 4], @rubyconf.find_evens(@enum)
  end

  def test_ignore_evens
    assert_equal [1, 3, 5], @rubyconf.ignore_evens(@enum)
  end

  def test_find_first_even
    assert_equal 2, @rubyconf.find_first_even(@enum)
  end

  def test_make_pairs_of_numbers_and_squares
    assert_equal [[1, 1], [2, 4], [3, 9], [4, 16], [5, 25]],
                 @rubyconf.make_pairs_of_numbers_and_squares(@enum)
  end

  def test_product
    assert_equal 120, @rubyconf.product(@enum)
  end

  def test_valid_email_addresses
    addresses = %w[user@example.com user_at_foo.org USER@foo.COM
                   first.last@foo.jp alice+bob@baz.cn
                   user@example,com user.name@example.
                   foo@bar_baz.com A_US-ER@foo.bar.org foo@bar+baz.com]
    assert_equal %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                    first.last@foo.jp alice+bob@baz.cn].to_set,
                 @rubyconf.valid_email_addresses(addresses).to_set
  end

  def test_evens_and_odds
    assert_equal [[2, 4], [1, 3, 5]], @rubyconf.evens_and_odds(@enum)
  end

  def test_more_squares_and_pairs
    assert_equal [[1, 1], [2, 4], [3, 9], [4, 16], [5, 25]],
                 @rubyconf.more_squares_and_pairs(@enum)
  end
end

