class Rubyconf

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
    retval = true
    enum.each do |n|
      retval = false unless n.odd?
    end
    retval
    # enum.all? { |e| e.odd? }
  end

  def none_are_odd(enum)
    retval = true
    enum.each do |n|
      retval = false if n.odd?
    end
    retval
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
    days = %w[Sunday Moonday Tiwsday (W)odensday Thorsday Friggday Saturnday]
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
      primes << i if i.prime?
      i += 1
      break if primes.length == n
    end
    primes
    # natural_numbers.select { |k| k.prime? }.take(n)
    # natural_numbers.select { |k| k.prime? }.first(n)
    # natural_numbers.select(&:prime?).first(n)
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






































