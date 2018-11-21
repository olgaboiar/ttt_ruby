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
    for i in (0..n)
      for j in (0..n)
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
    diagonals = Array.new(2) { Array.new}
    for i in (0..n)
      return true if matrix[i].uniq.length == 1
      diagonals[0] << matrix[i][i]
      diagonals[1] << matrix[i][n - i]
      for j in (0..n)
        verticals[j][i] = matrix[i][j]
      end
    end
    for i in (0..n)
      return true if verticals[i].uniq.length == 1
    end
    for i in (0..1)
      return true if diagonals[i].uniq.length == 1
    end
    return false
  end

end