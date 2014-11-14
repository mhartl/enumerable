require "minitest/autorun"
require './lib/rubyconf'

class TestRubyconf < Minitest::Test

  def setup
    @rubyconf = Rubyconf.new
  end

  def test_square_each_element
    assert_equal [1, 4, 9, 16, 25],
                 @rubyconf.square_each_element([1, 2, 3, 4, 5])
  end
end

