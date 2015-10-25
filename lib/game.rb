class Game
  attr_accessor :board
  def initialize(board)
    @board = board
    @com = "X"
    @hum = "O"
  end

  def start_game
    puts "Welcome to my Tic Tac Toe game"
    puts @board
    puts "Please select your spot."
    until @board.game_is_over || @board.tie
      get_human_spot
      if !@board.game_is_over && !@board.tie
        eval_board
      end
      puts @board
    end
    puts "Game over"
  end

  def get_human_spot
    spot = nil
    until spot
      spot = gets.chomp.to_i
      if @board.board[spot] != "X" && @board.board[spot] != "O"
        @board.board[spot] = @hum
      else
        spot = nil
      end
    end
  end

  def eval_board
    spot = nil
    until spot
      if @board.board[4] == "4"
        spot = 4
        @board.board[spot] = @com
      else
        spot = get_best_move(@board.board, @com)
        if @board.board[spot] != "X" && @board.board[spot] != "O"
          @board.board[spot] = @com
        else
          spot = nil
        end
      end
    end
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    available_spaces = []
    best_move = nil
    board.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end
    available_spaces.each do |as|
      board[as.to_i] = @com
      if @board.game_is_over
        best_move = as.to_i
        board[as.to_i] = as
        return best_move
      else
        board[as.to_i] = @hum
        if @board.game_is_over
          best_move = as.to_i
          board[as.to_i] = as
          return best_move
        else
          board[as.to_i] = as
        end
      end
    end
    if best_move
      return best_move
    else
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
    end
  end

  # def game_is_over(b)

  #   [b[0], b[1], b[2]].uniq.length == 1 ||
  #   [b[3], b[4], b[5]].uniq.length == 1 ||
  #   [b[6], b[7], b[8]].uniq.length == 1 ||
  #   [b[0], b[3], b[6]].uniq.length == 1 ||
  #   [b[1], b[4], b[7]].uniq.length == 1 ||
  #   [b[2], b[5], b[8]].uniq.length == 1 ||
  #   [b[0], b[4], b[8]].uniq.length == 1 ||
  #   [b[2], b[4], b[6]].uniq.length == 1
  # end

  # def tie(b)
  #   b.all? { |s| s == "X" || s == "O" }
  # end

end


