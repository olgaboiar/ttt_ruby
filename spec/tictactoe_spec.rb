# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/tictactoe'

describe TicTacToe do
  before do
    markers = Marker.new
    @player1 = Human.new(@input, markers, 'Vasya')
    @player2 = Human.new(@input, markers, 'Ivan')
    allow_any_instance_of(BoardSize).to receive(:set_size).and_return('3')
    @input = UserInteraction.new
    @input.choose_translation('1')
    @board = Board.new(@input, markers)
    board_size = BoardSize.new(@input)
    @setup = Setup.new(board_size.set_size)
    players = [@player1, @player2]
    @tictactoe = TicTacToe.new(players, @board, @input)
  end

  describe '#set_current_player(marker1, marker2, player1, player2)' do
    it 'should set current player to player1' do
      marker1 = 'X'
      marker2 = 'O'
      @tictactoe.set_current_player(marker1, marker2, @player1, @player2)
      expect(@tictactoe.current_player).to eq(@player1)
    end
    it 'should set current player to player2' do
      marker1 = 'O'
      marker2 = 'X'
      @tictactoe.set_current_player(marker1, marker2, @player1, @player2)
      expect(@tictactoe.current_player).to eq(@player2)
    end
  end

  describe '#set_current_marker(marker1, marker2)' do
    it 'should set current player marker to X' do
      marker1 = 'X'
      marker2 = 'O'
      @tictactoe.set_current_marker(marker1, marker2)
      expect(@tictactoe.current_marker).to eq('X')
    end
    it 'should set current player to player2' do
      marker1 = 'O'
      marker2 = 'X'
      @tictactoe.set_current_marker(marker1, marker2)
      expect(@tictactoe.current_marker).to eq('X')
    end
  end

  describe '#play(board)' do
    # before do
    #   @current_player = @player1
    # end
    it 'the board is tie' do
      @board.insert_value(2, 'O')
      @board.insert_value(0, 'X')
      @board.insert_value(4, 'O')
      @board.insert_value(7, 'O')
      @board.insert_value(1, 'X')
      @board.insert_value(3, 'O')
      @board.insert_value(5, 'X')
      @board.insert_value(6, 'X')
      @board.insert_value(8, 'X')
      expect do
        @tictactoe.play(@board)
      end.to output("Game over!\nIt's a tie! Let's play again!\n").to_stdout
    end

    it ' ' do
      @board.insert_value(0, 'X')
      @board.insert_value(4, 'O')
      @board.insert_value(1, 'X')
      @board.insert_value(2, 'O')
      @board.insert_value(7, 'X')
      @board.insert_value(3, 'O')
      @board.insert_value(8, 'X')
      marker1 = 'X'
      marker2 = 'O'
      markers = Marker.new
      player1 = Computer.new(@input, markers, 'ii', 2)
      player2 = Computer.new(@input, markers, 'Ivan', 2)
      allow_any_instance_of(UserInteraction).to receive(:entering_number)
      @tictactoe.set_current_player(marker1, marker2, player1, player2)
      expect do
        @tictactoe.play(@board)
      end.to output("Computer just made a move on cell 7 It's your turn now!\n \n  X |  X |  O |\n----+----+----+\n  O |  O |  6 |\n----+----+----+\n  X |  X |  X |\n----+----+----+\nGame over!\nX wins!\n").to_stdout
    end
  end

  describe '#print_board' do
    it 'should print tictactoe board' do
      expect do
        @tictactoe.print_board
      end.to output(" \n  1 |  2 |  3 |\n----+----+----+\n  4 |  5 |  6 |\n----+----+----+\n  7 |  8 |  9 |\n----+----+----+\n").to_stdout
    end
  end

  describe '#game_over' do
    it 'should return true when tie is reached' do
      @board.insert_value(2, 'O')
      @board.insert_value(0, 'X')
      @board.insert_value(4, 'O')
      @board.insert_value(7, 'O')
      @board.insert_value(1, 'X')
      @board.insert_value(3, 'O')
      @board.insert_value(5, 'X')
      @board.insert_value(6, 'X')
      @board.insert_value(8, 'X')
      actual = @tictactoe.game_over(@board)
      expect(actual).to be(true)
    end
    it 'should return true when win is reached' do
      @board.insert_value(1, 'X')
      @board.insert_value(0, 'O')
      @board.insert_value(4, 'X')
      @board.insert_value(6, 'O')
      @board.insert_value(7, 'X')
      actual = @tictactoe.game_over(@board)
      expect(actual).to be(true)
    end
    it 'should return false when neither win nor tie is reached' do
      actual = @tictactoe.game_over(@board)
      expect(actual).to be_falsey
    end
    it 'should return false when neither win nor tie is reached' do
      @board.insert_value(2, 'X')
      @board.insert_value(0, 'O')
      @board.insert_value(4, 'X')
      actual = @tictactoe.game_over(@board)
      expect(actual).to be_falsey
    end
  end

  describe '#tie' do
    it 'should return true wneh all cells are X or O' do
      @board.insert_value(2, 'X')
      @board.insert_value(0, 'O')
      @board.insert_value(4, 'X')
      @board.insert_value(7, 'O')
      @board.insert_value(1, 'X')
      @board.insert_value(3, 'O')
      @board.insert_value(5, 'X')
      @board.insert_value(6, 'O')
      @board.insert_value(8, 'X')
      actual = @tictactoe.tie(@board)
      expect(actual).to be(true)
    end
    it 'should return false wneh not all cells are X or O' do
      @board.insert_value(2, 'X')
      @board.insert_value(0, 'O')
      @board.insert_value(4, 'X')
      @board.insert_value(7, 'O')
      @board.insert_value(6, 'X')
      actual = @tictactoe.tie(@board)
      expect(actual).to be_falsey
    end
  end

  describe '#declare_winner' do
    it 'should declare X as a winner when X is the last move' do
      @board.insert_value(1, 'X')
      @board.insert_value(0, 'O')
      @board.insert_value(4, 'X')
      @board.insert_value(6, 'O')
      @board.insert_value(7, 'X')
      expect do
        @tictactoe.declare_winner
      end.to output("X wins!\n").to_stdout
    end
  end
end
