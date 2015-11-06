require_relative 'englishView.rb'
require_relative 'spanishView.rb'
module View
  def self.welcome(board, language = 2)
    case language
    when 1
      EnglishView.welcome(board)
    when 2
      SpanishView.welcome(board)
    else
      puts "bad input"
    end
  end

  def self.choose_players_types(language = 2)
    case language
    when 1
      EnglishView.choose_players_types
    when 2
      SpanishView.choose_players_types
    else
      puts "bad input"
    end
  end

  def self.marker_validation(language = 2)
    case language
    when 1
      EnglishView.marker_validation
    when 2
      SpanishView.marker_validation
    else
      puts "bad input"
    end
  end

  def self.choose_new_marker(player, language = 2)
    case language
    when 1
      EnglishView.choose_new_marker(player)
    when 2
      SPanishView.choose_new_marker(player)
    else
      puts "bad input"
    end
  end

  def self.player_setup(player, other_player, language = 2)
    case language
    when 1
      EnglishView.player_setup(player, other_player)
    when 2
      SpanishView.player_setup(player, other_player)
    else
      puts "bad input"
    end
  end

  def self.set_marker_color(player, other_player, language = 2)
    case language
    when 1
      EnglishView.set_marker_color(player, other_player)
    when 2
      SpanishView.set_marker_color(player, other_player)
    else
      puts "bad input"
    end
  end

  def self.first_player_select(player, other_player, language = 2)
    case language
    when 1
      EnglishView.first_player_select(player, other_player)
    when 2
      SpanishView.first_player_select(player, other_player)
    else
      puts "bad input"
    end
  end

  def self.computer_thinking(player, language = 2)
    case language
    when 1
      EnglishView.computer_thinking(player)
    when 2
      SpanishView.computer_thinking(player)
    else
      puts "bad input"
    end
  end

  def self.player_choice(player, spot, language = 2)
    case language
    when 1
      EnglishView.player_choice(player, spot)
    when 2
      SpanishView.player_choice(player, spot)
    else
      puts "bad input"
    end
  end

  def self.get_user_input(name, language = 2)
    case language
    when 1
      EnglishView.get_user_input(name)
    when 2
      SpanishView.get_user_input(name)
    else
      puts "bad input"
    end
  end

  def self.print_board(board, language = 2)
    case language
    when 1
      EnglishView.print_board(board)
    when 2
      SpanishView.print_board(board)
    else
      puts "bad input"
    end
  end

  def self.game_over(language = 2)
    case language
    when 1
      EnglishView.game_over
    when 2
      SpanishView.game_over
    else
      puts "bad input"
    end
  end

  def self.tie(language = 2)
    case language
    when 1
      EnglishView.tie
    when 2
      SpanishView.tie
    else
      puts "bad input"
    end
  end

  def self.winner(name, language = 2)
    case language
    when 1
      EnglishView.winner(name)
    when 2
      SpanishView.winner(name)
    else
      puts "bad input"
    end
  end

  def self.spot_taken(language = 2)
    case language
    when 1
      EnglishView.spot_taken
    when 2
      SpanishView.spot_taken
    else
      puts "bad input"
    end
  end

  def self.invalid_input(language = 2)
    case language
    when 1
      EnglishView.invalid_input
    when 2
      SpanishView.invalid_input
    else
      puts "bad input"
    end
  end

end