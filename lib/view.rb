require_relative 'englishView.rb'
module View
  def self.welcome(board, language = 1)
    case language
    when 1
      EnglishView.welcome(board)
    else
      puts "bad input"
    end
  end

  def self.choose_players_types(language = 1)
    case language
    when 1
      EnglishView.choose_players_types
    else
      puts "bad input"
    end
  end

  def self.marker_validation(language = 1)
    case language
    when 1
      EnglishView.marker_validation
    else
      puts "bad input"
    end
  end

  def self.choose_new_marker(player, language = 1)
    case language
    when 1
      EnglishView.choose_new_marker(player)
    else
      puts "bad input"
    end
  end

  def self.player_setup(player, other_player, language = 1)
    case language
    when 1
      EnglishView.player_setup(player, other_player)
    else
      puts "bad input"
    end
  end

  def self.set_marker_color(player, other_player, language = 1)
    case language
    when 1
      EnglishView.set_marker_color(player, other_player)
    else
      puts "bad input"
    end
  end

  def self.first_player_select(player, other_player, language = 1)
    case language
    when 1
      EnglishView.first_player_select(player, other_player)
    else
      puts "bad input"
    end
  end

  def self.computer_thinking(player, language = 1)
    case language
    when 1
      EnglishView.computer_thinking(player)
    else
      puts "bad input"
    end
  end

  def self.player_choice(player, spot, language = 1)
    case language
    when 1
      EnglishView.player_choice(player, spot)
    else
      puts "bad input"
    end
  end

  def self.get_user_input(name, language = 1)
    case language
    when 1
      EnglishView.get_user_input(name)
    else
      puts "bad input"
    end
  end

  def self.print_board(board, language = 1)
    case language
    when 1
      EnglishView.print_board(board)
    else
      puts "bad input"
    end
  end

  def self.game_over(language = 1)
    case language
    when 1
      EnglishView.game_over
    else
      puts "bad input"
    end
  end

  def self.tie(language = 1)
    case language
    when 1
      EnglishView.tie
    else
      puts "bad input"
    end
  end

  def self.winner(name, language = 1)
    case language
    when 1
      EnglishView.winner(name)
    else
      puts "bad input"
    end
  end

  def self.spot_taken(language = 1)
    case language
    when 1
      EnglishView.spot_taken
    else
      puts "bad input"
    end
  end

  def self.invalid_input(language = 1)
    case language
    when 1
      EnglishView.invalid_input
    else
      puts "bad input"
    end
  end

end