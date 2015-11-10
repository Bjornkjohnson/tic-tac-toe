require_relative 'englishView.rb'
require_relative 'spanishView.rb'
module View
  def self.language_select
    puts "\e[H\e[2J"
    puts "Select language"
    puts "1: English"
    puts "2: Español"
    print ">"
    gets.chomp.to_i
  end

  def self.welcome(board, language)
    case language
    when 1
      EnglishView.welcome(board)
    when 2
      SpanishView.welcome(board)
    end
  end

  def self.choose_players_types(language)
    case language
    when 1
      EnglishView.choose_players_types
    when 2
      SpanishView.choose_players_types
    end
  end

  # def self.marker_validation(language)
  #   case language
  #   when 1
  #     EnglishView.marker_validation
  #   when 2
  #     SpanishView.marker_validation
  #   else
  #     puts "bad input"
  #   end
  # end

  def self.choose_new_marker(player, language)
    case language
    when 1
      EnglishView.choose_new_marker(player)
    when 2
      SPanishView.choose_new_marker(player)
    end
  end

  def self.player_setup(player, other_player, language)
    case language
    when 1
      EnglishView.player_setup(player, other_player)
    when 2
      SpanishView.player_setup(player, other_player)
    end
  end

  def self.set_marker_color(player, other_player, language)
    case language
    when 1
      EnglishView.set_marker_color(player, other_player)
    when 2
      SpanishView.set_marker_color(player, other_player)
    end
  end

  def self.first_player_select(player, other_player, language)
    case language
    when 1
      EnglishView.first_player_select(player, other_player)
    when 2
      SpanishView.first_player_select(player, other_player)
    end
  end

  def self.computer_thinking(player, language)
    case language
    when 1
      EnglishView.computer_thinking(player)
    when 2
      SpanishView.computer_thinking(player)
    end
  end

  def self.player_choice(player, spot, language)
    case language
    when 1
      EnglishView.player_choice(player, spot)
    when 2
      SpanishView.player_choice(player, spot)
    end
  end

  def self.get_user_input(name, language)
    case language
    when 1
      EnglishView.get_user_input(name)
    when 2
      SpanishView.get_user_input(name)
    end
  end

  def self.print_board(board, language)
    case language
    when 1
      EnglishView.print_board(board)
    when 2
      SpanishView.print_board(board)
    end
  end

  def self.game_over(language)
    case language
    when 1
      EnglishView.game_over
    when 2
      SpanishView.game_over
    end
  end

  def self.tie(language)
    case language
    when 1
      EnglishView.tie
    when 2
      SpanishView.tie
    end
  end

  def self.winner(name, language)
    case language
    when 1
      EnglishView.winner(name)
    when 2
      SpanishView.winner(name)
    end
  end

  def self.spot_taken(language)
    case language
    when 1
      EnglishView.spot_taken
    when 2
      SpanishView.spot_taken
    end
  end

  def self.invalid_input(language)
    case language
    when 1
      EnglishView.invalid_input
    when 2
      SpanishView.invalid_input
    end
  end

end