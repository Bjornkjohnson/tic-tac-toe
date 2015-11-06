require_relative 'game'
require_relative 'player'
require_relative 'board'

describe "Board" do
  before :each do
    @board = Board.new
  end
  it "should generate a board" do
    expect(@board.board).to eq ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  it "should return available spaces in an array" do
    @board[1] = 'X'
    @board[5] = 'O'
    expect(@board.available_spaces('X', 'O')).to eq ["0", "2", "3", "4", "6", "7", "8"]
  end

  it "should return true if starter space are empty(corners and middle)" do
    
    expect(@board.starter_spaces_are_available?).to be true
  end

  it "should return false if starter space are not empty(corners and middle)" do
    @board[0] = 'X'
    expect(@board.starter_spaces_are_available?).to be false
  end

  it "should return game is over true" do
    @board[1] = 'X'
    @board[4] = 'X'
    @board[7] = 'X'
    expect(@board.game_is_over).to be true
  end

  it "should return game is over true" do
    expect(@board.game_is_over).to be false
  end

  it "should return tie is true" do
    @board.board = ["X", "O", "X", "O", "X", "O", "O", "X", "O"]
    expect(@board.tie).to be true
  end

  it "should return tie is false" do
    expect(@board.tie).to be false
  end
end

describe "Computer" do
  before :each do
    @board = Board.new
    @computer = Computer.new
  end
  it "should return winning move scenario 1" do
    @board.board = ["O", "X", "O", 
                    "O", "X", "X", 
                    "6", "7", "8"]
    expect(@computer.get_best_move(@board, "O")).to eq 7
  end
  it "should return winning move scenario 2" do
    @board.board = ["X", "O", "X",
                    "X", "X", "O", 
                    "6", "7", "8"]
    expect(@computer.get_best_move(@board, "O")).to eq 6
  end
  it "should choose wining move not block scenario 1" do
    @board.board = ["O", "O", "X", 
                    "O", "4", "X", 
                    "6", "7", "8"]
    expect(@computer.get_best_move(@board, "O")).to eq 8
  end
  it "should choose wining move not block scenario 2" do
    @board.board = ["0", "O", "O", 
                    "3", "4", "O", 
                    "6", "X", "X"]
    expect(@computer.get_best_move(@board, "O")).to eq 6
  end
end

describe "Game" do
  before :each do
    @board = Board.new
    @game = Game.new(@board)
    allow(View).to receive(:spot_taken).and_return('')
    allow(View).to receive(:print_board).and_return('')
    allow(View).to receive(:invalid_input).and_return('')
  end
  it "should return false if spot is taken" do
    @board.board = ["O", "X", "O", "O", "X", "X", "6", "7", "8"]
    expect(@game.validate_human_move(0)).to be false
  end
  it "should return false if validation recieves invalid input" do
    expect(@game.validate_human_move(99)).to be false
  end
end
