require_relative 'view'

class Game
  # attr_accessor :board
  def initialize(board)
    @board = board
    @player1 = "X"
    @player2 = "O"
  end

  def validate_human_move(spot)
    if @board[spot] == @player1.marker || @board[spot] == @player2.marker 
      View.spot_taken
      View.print_board(@board)
      return false
    elsif !(/^[0-8]$/.match(spot.to_s))
      View.invalid_input
      View.print_board(@board)
      return false
    end
    true
  end

  def get_human_spot(player)
    
    spot = View.get_user_input(player.name).to_i
    while !validate_human_move(spot)
      spot = View.get_user_input(player.name).to_i
    end
    @board[spot] = player.marker
  end

  def turn(player, next_player)
      if player.class == Human
        get_human_spot(player)
      else
        View.computer_thinking(player)
        player_choice = player.eval_board(@board, next_player.marker)
        View.player_choice(player, player_choice)
      end
      View.print_board(@board)
  end

  def first_player_select(player, other_player)
    loop do
      first_player = View.first_player_select(player,other_player)
      if first_player == 1
        @player1 = player
        @player2 = other_player
        break
      elsif first_player == 2
        @player1 = other_player
        @player2 = player
        break
      else
        View.invalid_input
      end
    end
  end

  def validate_markers_are_unique(p1,p2)
    while p1.marker == p2.marker
      View.choose_new_marker(p2)
    end
  end

  def setup
    choice = View.choose_players_types
    while choice != 1 && choice != 2 && choice != 3
      View.invalid_input
      choice = View.choose_players_types
    end
    case choice
    when 1
      p1 = Human.new
      p2 = Human.new
    when 2
      p1 = Computer.new
      p2 = Computer.new
    when 3
      p1 = Human.new
      p2 = Computer.new
    end
      View.player_setup(p1, p2)
      validate_markers_are_unique(p1,p2)
      View.set_marker_color(p1,p2)
      first_player_select(p1, p2)
  end

  def determine_winner
    if @board.winner == @player1.marker
      View.winner(@player1.name)
    else
      View.winner(@player2.name)
    end
  end

  def start_game
    View.welcome(@board)
    setup
    View.print_board(@board)
    until @board.game_is_over || @board.tie
      turn(@player1, @player2)
      if !@board.game_is_over && !@board.tie
        turn(@player2, @player1)
      end
    end
    View.tie if @board.tie
    determine_winner if @board.game_is_over
    View.game_over
  end


end


