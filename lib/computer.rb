# This class definies computer behavior
class Computer
  attr_accessor :markers, :opponent, :name

  def initialize(userinteraction, markers, name, difficulty)
    @markers = markers
    @name = name
    @ui = userinteraction
    @difficulty = difficulty
  end

  def define_opponent(symbol)
    if symbol == @markers.x
      @opponent = @markers.o
      @computer = @markers.x
    else
      @opponent = @markers.x
      @computer = @markers.o
    end
  end

  def define_symbol(hum)
    return @markers.o if hum == @markers.x

    @markers.x
  end

  def move(board, symbol)
    define_opponent(symbol)
    set_best_move(board, @opponent) if @difficulty == 2
    @best_move = get_random_move(board) if @difficulty == 1
    sleep(2)
    board.insert_value(@best_move.to_i - 1, symbol)
    @ui.computer_move(@best_move)
  end

  def set_best_move(board, last_move, depth = 0, scores = [], moves = [])
    current_move = nil
    return get_move_score(board, last_move, depth) if board.game_over

    board.available_spots.each do |as|
      potential_board = board.dup
      current_move = next_player(last_move)
      potential_board.insert_value(as.to_i - 1, current_move)
      scores.push set_best_move(potential_board, current_move, depth + 1)
      potential_move(moves, potential_board, as)
    end
    return_score(current_move, scores, moves)
  end

  def potential_move(moves, potential_board, spot)
    moves.push spot.to_i
    potential_board.insert_value(spot.to_i - 1, spot)
  end

  def return_score(current_move, scores, moves)
    if current_move == @computer
      max_score_index = scores.each_with_index.max[1]
      @best_move = moves[max_score_index]
      scores.max
    elsif current_move == @opponent
      min_score_index = scores.each_with_index.min[1]
      @best_move = moves[min_score_index]
      scores.min
    end
  end

  def get_random_move(board)
    n = rand(0..board.available_spots.count)
    board.available_spots[n]
  end

  def get_move_score(board, last_move, depth)
    if board.win
      return (10 - depth) if last_move == @computer
      return (depth - 10) if last_move == @opponent
    elsif board.tie
      0
    end
  end

  def next_player(last_move)
    return @computer if last_move == @opponent

    @opponent
  end
end
