class Game
  attr_accessor :board
  def initialize(board, computer, human)
    
    @board = board
    @computer = computer
    @human = human
  end

  def get_user_input
    
      puts "Please select your spot."
      spot = gets.chomp
    
  end

  def start_game
    puts "Welcome to my Tic Tac Toe game"
    puts @board
    
    until @board.game_is_over || @board.tie
      puts "HUMAN TURN"
      #Not the best
      until @human.get_human_spot(@board, @computer.marker, get_user_input)do
      end
      ####
      puts @board
      if !@board.game_is_over && !@board.tie
        @computer.eval_board(@board, @human.marker)
      end
      puts "COMPUTER TURN"
      puts @board
    end
    puts "Game over"
  end


end


