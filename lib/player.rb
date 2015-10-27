require_relative 'board'

class Player 
  attr_accessor :name, :marker
  def to_s
    @marker
  end
end

class Computer < Player
	def initialize(name = "Computer", marker = "X")
    @name = name
    @marker = marker
  end

  def eval_board(board, opponent_marker)
    spot = nil
    until spot
      if board[4] == "4"
        spot = 4
        board[spot] = @marker
        return spot
      else
        spot = get_best_move(board, opponent_marker)
        if board[spot] != @marker && board[spot] != opponent_marker
          board[spot] = @marker
          return spot
        else
          spot = nil
        end
      end
    end
  end

  def get_best_move(board, opponent_marker, depth = 0, best_score = {})
    available_spaces = []
    best_move = nil

    available_spaces = board.available_spaces(@marker, opponent_marker)

    available_spaces.each do |as|
      board[as.to_i] = @marker
      if board.game_is_over
        best_move = as.to_i
        board[as.to_i] = as
        return best_move
      else
        board[as.to_i] = opponent_marker
        if board.game_is_over
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
end

class Human < Player
	def initialize(name = "Guest", marker = "O")
    @name = name
    @marker = marker
  end

  def get_human_spot(board, opponent_marker, get_spot)
  	if !(/^[0-8]$/.match(get_spot.to_s))
  		return nil
  	end
  	get_spot = get_spot.to_i
    if board[get_spot] != opponent_marker && board[get_spot] != @marker 
      board[get_spot] = @marker 
      return 1
    else
      return nil
    end
  end
end

# board = Board.new
# human = Human.new
# human.get_human_spot(board, @marker)
# puts board