module View
	def self.welcome(board)
		puts "\e[H\e[2J"
    puts "Welcome to my Tic Tac Toe game"
    #puts board
	end

	def self.choose_players_types
		puts "Please Choose:"
		puts "1: Human vs. Human"
		puts "2: Computer vs. Computer"
		puts "3: Human vs. Computer"
		print '>'
		gets.chomp.to_i
	end

	def self.marker_validation
		marker = ''
		loop do
			print "Please choose a single character marker: "
			marker = gets.chomp
			if marker.length == 1
				break
			else
				puts "\e[H\e[2J"
				puts "Marker must be a single character."
				sleep(1.5)
				puts "\e[H\e[2J"
			end
			
		end

		return marker
	end

	def self.player_setup(player, other_player)
		print "Please choose a name: "
		player.name = gets.chomp.red
		# print "Please choose a marker: "
		player.marker = marker_validation.red
		print "Please choose another name: "
		other_player.name = gets.chomp.blue
		# print "Please choose another marker: "
		other_player.marker = marker_validation.blue
	end

	def self.first_player_select(player, other_player)
		puts "Who would like to go first?"
		puts "1: #{player.name}"
		puts "2: #{other_player.name}"
		print '>'
		choice = gets.chomp.to_i
	end

	def self.computer_thinking(player)
		puts "#{player.name} is contemplating..."
    sleep(1)
	end

	def self.player_choice(player, spot)
		puts "#{player.name} chose #{spot}."
		sleep(1)
	end

	def self.get_user_input(name)
		puts "#{name}'s turn"
    puts "Please select your spot."
    print '>'
    spot = gets.chomp
	end

	def self.print_board(board)
		puts "\e[H\e[2J"
		puts "TIC TAC TOE"
    puts board
	end

	def self.game_over
		puts "Game over"
	end

	def self.tie
		puts "It's a Tie!"
	end

	def self.winner(name)
		puts "#{name} Won!"
	end

	def self.invalid_input
		puts "\e[H\e[2J"
		puts "Invalid Input!"
		sleep(1)
		puts "\e[H\e[2J"
	end

end