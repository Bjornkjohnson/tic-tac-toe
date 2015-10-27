module View
	def self.welcome(board)
		puts "\e[H\e[2J"
    puts "Welcome to my Tic Tac Toe game"
    puts board
	end
	def self.computer_thinking(player)
		puts "The #{player.name} is contemplating..."
    sleep(1)
	end

	def self.human_prompt(name)
		puts "#{name}'s turn"
    puts "Please select your spot."
	end

	def self.print_board(board)
		puts "\e[H\e[2J"
		puts "TIC TAC TOE"
    puts board
	end

	def self.game_over
		puts "Game over"
	end
end