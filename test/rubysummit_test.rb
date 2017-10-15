require 'minitest/autorun'
require 'set'
require './lib/rubysummit'
require 'stringio'

module Kernel

  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end
end


class TestRubySummit < Minitest::Test

  def setup
    @rubysummit = RubySummit.new
    @enum       = [1, 2, 3, 4, 5]
  end

  def test_first_n_elements
    assert_equal [1, 2, 3],
                 @rubysummit.first_n_elements(@enum, 3)
  end

  def test_square_each_element
    assert_equal [1, 4, 9, 16, 25],
                 @rubysummit.square_each_element(@enum)
  end

  def test_any_are_odd
    assert  @rubysummit.any_are_odd(@enum)
    assert !@rubysummit.any_are_odd([2, 4, 6])
  end

  def test_all_are_odd
    assert !@rubysummit.all_are_odd(@enum)
    assert  @rubysummit.all_are_odd([1, 3, 5])
  end

  def test_none_are_odd
    assert !@rubysummit.none_are_odd(@enum)
    assert  @rubysummit.none_are_odd([2, 4, 6])
  end

  def test_find_evens
    assert_equal [2, 4], @rubysummit.find_evens(@enum)
  end

  def test_ignore_evens
    assert_equal [1, 3, 5], @rubysummit.ignore_evens(@enum)
  end

  def test_find_first_even
    assert_equal 2, @rubysummit.find_first_even(@enum)
  end

  def test_make_pairs_of_numbers_and_squares
    assert_equal [[1, 1], [2, 4], [3, 9], [4, 16], [5, 25]],
                 @rubysummit.make_pairs_of_numbers_and_squares(@enum)
  end

  def test_product
    assert_equal 120, @rubysummit.product(@enum)
  end

  def test_valid_email_addresses
    addresses = %w[user@example.com user_at_foo.org USER@foo.COM
                   first.last@foo.jp alice+bob@baz.cn
                   user@example,com user.name@example.
                   foo@bar_baz.com A_US-ER@foo.bar.org foo@bar+baz.com]
    assert_equal %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                    first.last@foo.jp alice+bob@baz.cn].to_set,
                 @rubysummit.valid_email_addresses(addresses).to_set
  end

  def test_evens_and_odds
    assert_equal [[2, 4], [1, 3, 5]], @rubysummit.evens_and_odds(@enum)
  end

  def test_more_squares_and_pairs
    assert_equal [[1, 1], [2, 4], [3, 9], [4, 16], [5, 25]],
                 @rubysummit.more_squares_and_pairs(@enum)
  end

  def test_first_n_primes
    assert_equal [2, 3, 5, 7, 11, 13, 17, 19, 23, 29],
                 @rubysummit.first_n_primes(10)
  end
end
























