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
      if board.starter_spaces_are_available
        spot = [0,2,4,6,8].sample
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
  	return 0 if board.tie
    return -1 if board.game_is_over

    current_player_mark = ''
    if depth % 2 == 0
  		current_player_mark = @marker
  	else
  		current_player_mark = opponent_marker
  	end

    as = board.available_spaces(@marker, opponent_marker)
    
    as.each do |spot|
      board[spot.to_i] = current_player_mark
      best_score[spot.to_i] = -1 * get_best_move(board, opponent_marker, depth + 1, {})
      board[spot.to_i] = spot
    end

    best_move = best_score.max_by { |key, value| value }[0]
    highest_minimax_score = best_score.max_by { |key, value| value }[1]

    if depth == 0
      return best_move
    elsif depth > 0
      return highest_minimax_score
    end


  #   available_spaces = []
  #   best_move = nil

  #   available_spaces = board.available_spaces(@marker, opponent_marker)

  #   available_spaces.each do |as|
  #     board[as.to_i] = @marker
  #     if board.game_is_over
  #       best_move = as.to_i
  #       board[as.to_i] = as
  #       return best_move
  #     else
  #       board[as.to_i] = opponent_marker
  #       if board.game_is_over
  #         best_move = as.to_i
  #         board[as.to_i] = as
  #         return best_move
  #       else
  #         board[as.to_i] = as
  #       end
  #     end
  #   end
  #   if best_move
  #     return best_move
  #   else
  #     n = rand(0..available_spaces.count)
  #     return available_spaces[n].to_i
  #   end
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