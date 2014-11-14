class Rubyconf

  def init
  end

  def return_first_n_elements(enum, n)
    i = 0
    retval = []
    enum.each do |e|
      retval << e
      i += 1
      break if i >= n
    end
    retval
    # enum.take(n)
    # enum.first(n)
  end

  def any_are_odd(enum)
    enum.each do |e|
      return true if e.odd?
    end
    false
    enum.any? { |e| e.odd? }
  end

  def all_are_odd(enum)
    retval = true
    enum.each do |e|
      retval = false unless e.odd?
    end
    retval
    enum.all? { |e| e.odd? }
  end

  def none_are_odd(enum)
    retval = true
    enum.each do |e|
      retval = false if e.odd?
    end
    retval
    enum.none? { |e| e.odd? }
  end

  def square_each_element(enum)
    squares = []
    enum.each do |e|
      squares << e**2
    end
    squares
    enum.map { |e| e**2 }
  end
end