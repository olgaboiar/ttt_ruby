# frozen_string_literal: true

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
    create_output(matrix)
  end

  def create_output(matrix)
    puts ' '
    (0..@index).each do |i|
      row = matrix[i]
      create_cells(row)
      create_border
    end
  end

  def create_cells(row)
    (0..@index).each do |j|
      print "  #{row[j]} |" if row[j].length == 1
      print " #{row[j]} |" if row[j].length > 1
    end
  end

  def create_border
    print "\n"
    puts '----+' * @argument
  end

  def win
    matrix = @board.each_slice(@argument).to_a
    verticals = Array.new(@argument) { Array.new(@argument) }
    diagonals = Array.new(2) { [] }
    create_vert_diag(matrix, verticals, diagonals)
    return true if win_horizontals(matrix)
    return true if win_verticals(verticals)
    return true if win_diagonals(diagonals)

    false
  end

  def create_vert_diag(matrix, verticals, diagonals)
    (0..@index).each do |i|
      diagonals[0] << matrix[i][i]
      diagonals[1] << matrix[i][@index - i]
      (0..@index).each do |j|
        verticals[j][i] = matrix[i][j]
      end
    end
  end

  def win_horizontals(matrix)
    (0..@index).each do |i|
      return true if matrix[i].uniq.length == 1
    end
    false
  end

  def win_verticals(verticals)
    (0..@index).each do |i|
      return true if verticals[i].uniq.length == 1
    end
    false
  end

  def win_diagonals(diagonals)
    (0..1).each do |i|
      return true if diagonals[i].uniq.length == 1
    end
    false
  end
end
