require_relative 'englishView.rb'
require_relative 'spanishView.rb'
module ViewSelect
  def self.print_view_select
    puts "\e[H\e[2J"
    puts "Select view"
    puts "1: English"
    puts "2: Español"
    print ">"
    gets.chomp.to_i
  end

  def self.validate_view_select
    @view = print_view_select
    while !(/^[1-2]$/.match(@view.to_s))
      invalid_input
      @view = print_view_select
    end
    return @view
  end

  def self.invalid_input
    puts "\e[H\e[2J"
    puts "Invalid Input!"
    sleep(1)
    puts "\e[H\e[2J"
  end

  def self.view_select
    case validate_view_select
    when 1
      view = EnglishView.new
    when 2
      view = SpanishView.new
    end
  end

end
