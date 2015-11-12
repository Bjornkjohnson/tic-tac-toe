require_relative 'view'

class Game
  def initialize(board, view)
    @board = board
    @player1 = Computer.new
    @player2 = Human.new
    @view = view
  end

  def validate_human_move(spot)
    if @board[spot] == @player1.marker || @board[spot] == @player2.marker 
      @view.spot_taken
      @view.print_board(@board)
      return false
    elsif !(/^[0-8]$/.match(spot.to_s))
      @view.invalid_input
      @view.print_board(@board)
      return false
    end
    true
  end

  def get_human_spot(player)
    spot = @view.get_user_input(player.name).to_i
    while !validate_human_move(spot)
      spot = @view.get_user_input(player.name).to_i
    end
    @board[spot] = player.marker
  end

  def turn(player, next_player)
    if player.class == Human
      get_human_spot(player)
    else
      @view.computer_thinking(player)
      player_choice = player.eval_board(@board, next_player.marker)
      @view.player_choice(player, player_choice)
    end
    @view.print_board(@board)
  end

  def first_player_select(player, other_player)
    loop do
      first_player = @view.first_player_select(player,other_player)
      if first_player == 1
        @player1 = player
        @player2 = other_player
        break
      elsif first_player == 2
        @player1 = other_player
        @player2 = player
        break
      else
        @view.invalid_input
      end
    end
  end

  def validate_markers_are_unique(p1,p2)
    while p1.marker == p2.marker
      @view.choose_new_marker(p2)
    end
  end

  def determine_winner
    if @board.winner == @player1.marker
      @view.winner(@player1.name)
    else
      @view.winner(@player2.name)
    end
  end

  def setup
    choice = @view.choose_players_types
    while choice != 1 && choice != 2 && choice != 3
      @view.invalid_input
      choice = @view.choose_players_types
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
      @view.player_setup(p1, p2)
      validate_markers_are_unique(p1,p2)
      @view.set_marker_color(p1,p2)
      first_player_select(p1, p2)
  end

  def start_game
    @view.welcome(@board)
    setup
    @view.print_board(@board)
    until @board.game_is_over || @board.tie
      turn(@player1, @player2)
      if !@board.game_is_over && !@board.tie
        turn(@player2, @player1)
      end
    end
    @view.tie if @board.tie
    determine_winner if @board.game_is_over
    @view.game_over
  end

end