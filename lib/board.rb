class Board
	attr_accessor :board, :winner
	def initialize
		@board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
	end

	def to_s
		"|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n"
	end

  def [](y)
    @board[y]
  end

  def []=(y, value)
    @board[y] = value
  end

  def available_spaces(marker1, marker2)
    available_spaces = []
    @board.each do |s|
      if s != marker1 && s != marker2
        available_spaces << s
      end
    end
    return available_spaces
  end

  def starter_spaces_are_available
    return true if @board[0] == '0' && @board[2]== '2' && @board[4]== '4' && @board[6]== '6' && @board[8] == '8'
    false
  end

	def game_is_over

    
    if [@board[0], @board[1], @board[2]].uniq.length == 1
      @winner = @board[0]
      return true
    elsif [@board[3], @board[4], @board[5]].uniq.length == 1
      @winner = @board[3]
      return true
    elsif [@board[6], @board[7], @board[8]].uniq.length == 1
      @winner = @board[6]
      return true
    elsif [@board[0], @board[3], @board[6]].uniq.length == 1
      @winner = @board[0]
      return true
    elsif [@board[1], @board[4], @board[7]].uniq.length == 1
      @winner = @board[1]
      return true
    elsif [@board[2], @board[5], @board[8]].uniq.length == 1
      @winner = @board[2]
      return true
    elsif [@board[0], @board[4], @board[8]].uniq.length == 1
      @winner = @board[0]
      return true
    elsif [@board[2], @board[4], @board[6]].uniq.length == 1
      @winner = @board[2]
      return true
    else
      return false
    end
  end

  def tie
    symbols = @board.uniq
    @board.all? { |s| s == symbols[0] || s == symbols[1] } && !game_is_over
  end
end
