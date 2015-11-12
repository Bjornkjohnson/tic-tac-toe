class SpanishView
  def welcome(board)
    puts "\e[H\e[2J"
    puts "Bienvenidos a mi juego de Tic Tac Toe"
  end

  def choose_players_types
    puts "Elegir un Scenerio Por Favor:"
    puts "1: Humano v. Humano"
   puts "2: Computadora v. Computadora"
    puts "3: Humano v. Computadora"
    print '>'
    gets.chomp.to_i
  end

  #validation here because other views may not be single character
  def marker_validation
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

  def choose_new_marker(player)
    puts "\e[H\e[2J"
    puts "Su marcador no es único."
    player.marker = marker_validation
  end

  def player_setup(player, other_player)
    puts "\e[H\e[2J"
    print "Elegir un nombre por favor: "
    player.name = gets.chomp
    player.marker = marker_validation
    print "Elige un nuevo nombre, por favor: "
    other_player.name = gets.chomp
    other_player.marker = marker_validation
  end

  def set_marker_color(player, other_player)
    player.name = player.name.red
    player.marker = player.marker.red
    other_player.name = other_player.name.blue
    other_player.marker = other_player.marker.blue
  end

  def first_player_select(player, other_player)
    puts "\e[H\e[2J"
    puts "¿Quién quiere ir primero?"
    puts "1: #{player.name}"
    puts "2: #{other_player.name}"
    print '>'
    choice = gets.chomp.to_i
  end

  def computer_thinking(player)
    puts "#{player.name} está contemplando..."
    sleep(1)
  end

  def player_choice(player, spot)
    puts "#{player.name} escogió #{spot}."
    sleep(1)
  end

  def get_user_input(name)
    puts "#{name}'s turno"
    puts "Seleccione su ubicación por favor."
    print '>'
    spot = gets.chomp
  end

  def print_board(board)
    puts "\e[H\e[2J"
    puts "TIC TAC TOE"
    puts board
  end

  def game_over
    puts "Fin del juego"
  end

  def tie
    puts "¡Es un empate!"
  end

  def winner(name)
    puts "¡#{name} ganó!"
  end

  def spot_taken
    puts "\e[H\e[2J"
    puts "¡Ese lugar se toma ya!"
    sleep(1)
    puts "\e[H\e[2J"
  end

  def invalid_input
    puts "\e[H\e[2J"
    puts "¡Entrada inválida!"
    sleep(1)
    puts "\e[H\e[2J"
  end

end