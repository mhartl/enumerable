class Rubyconf

  def init
  end

  def square_each_element(enum)
    squares = []
    enum.each do |e|
      squares << e**2
    end
    squares
  end
end