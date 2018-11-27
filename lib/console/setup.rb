# This class is responsible to print out the board properly into console
# Note for future refactoring: get rid of this class, move board printing
# related methods to ui class, board array method to board class, and win
# method to tictactoe class
class Setup
  def initialize(argument)
    @argument = argument.to_i
    @index = @argument - 1
  end

  def create_board_array
    @board = []
    (1..@argument * @argument).each do |i|
      @board << i.to_s
    end
    @board
  end

  def print_board
    matrix = @board.each_slice(@argument).to_a
    puts ' '
    (0..@index).each do |i|
      (0..@index).each do |j|
        print "  #{matrix[i][j]} |" if matrix[i][j].length == 1
        print " #{matrix[i][j]} |" if matrix[i][j].length > 1
      end
      print "\n"
      puts '----+' * @argument
    end
  end

  def win
    matrix = @board.each_slice(@argument).to_a
    verticals = Array.new(@argument) { Array.new(@argument) }
    diagonals = Array.new(2) { [] }
    (0..@index).each do |i|
      return true if matrix[i].uniq.length == 1

      diagonals[0] << matrix[i][i]
      diagonals[1] << matrix[i][@index - i]
      (0..@index).each do |j|
        verticals[j][i] = matrix[i][j]
      end
    end
    (0..@index).each do |i|
      return true if verticals[i].uniq.length == 1
    end
    (0..1).each do |i|
      return true if diagonals[i].uniq.length == 1
    end
    false
  end
end
