module SpanishView
  def self.welcome(board)
    puts "\e[H\e[2J"
    puts "Bienvenidos a mi juego de Tic Tac Toe"
  end

  def self.choose_players_types
    puts "Elegir un Scenerio Por Favor:"
    puts "1: Humano v. Humano"
   puts "2: Computadora v. Computadora"
    puts "3: Humano v. Computadora"
    print '>'
    gets.chomp.to_i
  end

  #validation here because other views may not be single character
  def self.marker_validation
    marker = ''
    loop do
      print "Elegir un marcador de carácter: "
      marker = gets.chomp
      if marker.length == 1
        break
      else
        puts "\e[H\e[2J"
        puts "Marker debe ser un solo carácter."
        sleep(1.5)
        puts "\e[H\e[2J"
      end
    end

    return marker
  end

  def self.choose_new_marker(player)
    puts "\e[H\e[2J"
    puts "Su marcador no es único."
    player.marker = marker_validation
  end

  def self.player_setup(player, other_player)
    puts "\e[H\e[2J"
    print "Elegir un nombre por favor: "
    player.name = gets.chomp
    player.marker = marker_validation
    print "Elige un nuevo nombre, por favor: "
    other_player.name = gets.chomp
    other_player.marker = marker_validation
  end

  def self.set_marker_color(player, other_player)
    player.name = player.name.red
    player.marker = player.marker.red
    other_player.name = other_player.name.blue
    other_player.marker = other_player.marker.blue
  end

  def self.first_player_select(player, other_player)
    puts "\e[H\e[2J"
    puts "¿Quién quiere ir primero?"
    puts "1: #{player.name}"
    puts "2: #{other_player.name}"
    print '>'
    choice = gets.chomp.to_i
  end

  def self.computer_thinking(player)
    puts "#{player.name} está contemplando..."
    sleep(1)
  end

  def self.player_choice(player, spot)
    puts "#{player.name} escogió #{spot}."
    sleep(1)
  end

  def self.get_user_input(name)
    puts "#{name}'s turno"
    puts "Seleccione su ubicación por favor."
    print '>'
    spot = gets.chomp
  end

  def self.print_board(board)
    puts "\e[H\e[2J"
    puts "TIC TAC TOE"
    puts board
  end

  def self.game_over
    puts "Fin del juego"
  end

  def self.tie
    puts "¡Es un empate!"
  end

  def self.winner(name)
    puts "¡#{name} ganó!"
  end

  def self.spot_taken
    puts "\e[H\e[2J"
    puts "¡Ese lugar se toma ya!"
    sleep(1)
    puts "\e[H\e[2J"
  end

  def self.invalid_input
    puts "\e[H\e[2J"
    puts "¡Entrada inválida!"
    sleep(1)
    puts "\e[H\e[2J"
  end

end