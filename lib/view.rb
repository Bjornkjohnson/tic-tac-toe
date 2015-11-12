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

  def self.invalid_input(language)
    case language
    when 1
      EnglishView.invalid_input
    when 2
      SpanishView.invalid_input
    end
  end

end