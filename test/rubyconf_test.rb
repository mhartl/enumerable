require "minitest/autorun"
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
end

