class Rubyconf

  def init
  end

  def return_first_n_elements(enum, n)
    i = 0
    retval = []
    enum.each do |k|
      retval << k
      i += 1
      break if i >= n
    end
    retval
    # enum.take(n)
    # enum.first(n)
  end

  def any_are_odd(enum)
    enum.each do |n|
      return true if n.odd?
    end
    false
    # enum.any? { |e| e.odd? }
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
end
