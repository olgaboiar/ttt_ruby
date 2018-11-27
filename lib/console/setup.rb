class Setup

  def initialize(argument)
    @argument = argument.to_i
  end

  def create_board_array
    @board = []
    for i in (1..@argument * @argument)
      @board << i.to_s
    end
    @board
  end

  def print_board
    matrix = @board.each_slice(@argument).to_a
    puts " "
    n = @argument - 1
    (0..n).each do |i|
      (0..n).each do |j|
        print "  #{matrix[i][j]} |" if matrix[i][j].length == 1
        print " #{matrix[i][j]} |" if matrix[i][j].length > 1
      end
      print "\n"
      puts "----+" * @argument
    end
  end

  def win
    matrix = @board.each_slice(@argument).to_a
    n = @argument - 1
    verticals = Array.new(@argument) { Array.new(@argument) }
    diagonals = Array.new(2) { Array.new }
    (0..n).each do |i|
      return true if matrix[i].uniq.length == 1

      diagonals[0] << matrix[i][i]
      diagonals[1] << matrix[i][n - i]
      for j in (0..n)
        verticals[j][i] = matrix[i][j]
      end
    end
    (0..n).each do |i|
      return true if verticals[i].uniq.length == 1
    end
    (0..1).each do |i|
      return true if diagonals[i].uniq.length == 1
    end
    return false
  end
end
