>> (1..10).class
=> Range

(1..10).each do |n|
  puts n**2
end

%w[foo bar baz].each do |word|
  puts word.reverse
end

hash = { name:  "Michael Hartl",
         email: "michael@michaelhartl.com"}
hash.each do |key, val|
  puts "Name is #{key}, email is #{val}"
end

User.all.each do |user|
  user.name.reverse!
  user.save!
end


class MyAwesomeClass
  include Enumerable

  def each(&block)
    .
    .
    .
  end
  .
  .
  .
end

class RubySummit

  def return_first_n_elements(enum, n)
    i = 0
    retval = []
    enum.each do |k|
      retval << k
      i += 1
      break if i >= n
    end
    retval
    # Why not [0...n]?
    # Enumerable#take
    # Enumerable#first
    # enum.take(n)
    # enum.first(n)
  end

  def any_are_odd(enum)
    enum.each do |n|
      return true if n.odd?
    end
    false
    # enum.any? { |e| e.odd? }
    # enum.any?(&:odd?)
  end

  def all_are_odd(enum)
    enum.each do |n|
      return false unless n.odd?
    end
    true
    # enum.all? { |e| e.odd? }
  end

  def none_are_odd(enum)
    enum.each do |n|
      return false if n.odd?
    end
    true
    # enum.none? { |e| e.odd? }
  end

  def square_each_element(enum)
    squares = []
    enum.each do |n|
      squares << n**2
    end
    squares
    # enum.map { |e| e**2 }
    # enum.collect { |e| e**2 }
  end

  def find_evens(enum)
    evens = []
    enum.each do |n|
      evens << n if n.even?
    end
    evens
    # enum.find { |n| n.even?}
    # enum.select { |n| n.even?}
  end

  def ignore_evens(enum)
    non_evens = []
    enum.each do |n|
      non_evens << n unless n.even?
    end
    non_evens
    # enum.reject { |n| n.even?}
  end

  def find_first_even(enum)
    enum.each do |n|
      return n if n.even?
    end
    # enum.find { |n| n.even? }
    # enum.detect { |n| n.even? }
  end

  def make_pairs_of_numbers_and_squares(enum)
    square_pairs = []
    enum.each do |n|
      square_pairs << [n, n**2]
    end
    square_pairs
    enum.inject([]) do |square_pairs, n|
      square_pairs << [n, n**2]
    end
  end

  def product(enum)
    factorial = 1
    enum.each do |n|
      factorial *= n
    end
    factorial
    enum.inject(1) do |factorial, n|
      factorial *= n
    end
    enum.inject(1, :*)
    enum.reduce(1, :*)
  end

  def valid_email_addresses(addresses)
    valid_email_regex = /[\w+\-.]+@[a-z\d\-.]+\.[a-z]+/i
    valid_emails = []
    addresses.each do |address|
      valid_emails << address if address =~ valid_email_regex
    end
    valid_emails
    # addresses.grep(valid_email_regex)
  end

  def evens_and_odds(enum)
    evens = []
    odds  = []
    enum.each do |n|
      if n.even?
        evens << n
      else
        odds << n
      end
    end
    [evens, odds]
    enum.partition { |n| n.even? }
  end

  def more_squares_and_pairs(enum)
    squares = enum.map { |n| n**2 }
    squares_and_pairs = []
    enum.each_with_index do |n, i|
      squares_and_pairs << [n, squares[i]]
    end
    squares_and_pairs
    enum.zip(squares)
  end

  def days_of_the_week
    days = %w[Sunday Moonday Tiwsday Wodensday Thorsday Friggday Saturnday]
    # 4.times do
    #   days.each do |day|
    #     puts "Today is #{day}"
    #   end
    # end
    days.cycle(4) { |day| puts "Today is #{day}" }
  end

  def first_n_primes(n)
    primes = []
    i = 1
    loop do
      is_prime = true
      if i == 1
        is_prime = false
      else
        (2..Math.sqrt(i)).each do |k|
          if i % k == 0
            is_prime = false
            break
          end
        end
      end
      primes << i if is_prime
      i += 1
      break if primes.length == n
    end
    primes
  end

  def first_n_primes(n)
    natural_numbers.select(&:prime?).first(n)
  end
end

def natural_numbers
  (1..Float::INFINITY).lazy
end

class Fixnum

  def prime?
    return false if self == 1
    return true  if self == 2
    (2..Math.sqrt(self)).each do |k|
      # return false if self % k == 0
      return false if divisible_by?(k)
    end
    return true
    (2..Math.sqrt(self)).none? { |k| divisible_by?(k) }
    (2..Math.sqrt(self)).none?(&:divisible_by?)
  end

  def divisible_by?(n)
    self % n == 0
  end
end



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
    @enum     = [1, 2, 3, 4, 5]
  end

  def test_return_first_n_elements
    assert_equal [1, 2, 3], @rubysummit.return_first_n_elements(@enum, 3)
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

  def test_days_of_the_week
    out = capture_stdout do
      @rubysummit.days_of_the_week
    end
    messages  = "Today is Sunday\nToday is Moonday\nToday is Tiwsday\n"
    messages += "Today is (W)odensday\nToday is Thorsday\nToday is Friggday\n"
    messages += "Today is Saturnday\n"
    assert_equal messages * 4, out.string
  end

  def test_first_n_primes
    assert_equal [2, 3, 5, 7, 11, 13, 17, 19, 23], @rubysummit.first_n_primes(9)
  end
end
