require_relative 'game'
require_relative 'player'
require_relative 'board'

describe "Tic Tac Toe" do
  
  
  it "should never let the user win"
  it "should display whos turn it is"
  it "should display what spot a user chose"
  it "should allow users to choose game type"
  it "should allow user to choose who goes first"
  it "allow user to choose marker"

end

describe "Board" do
  it "should generate a board" do
    board = Board.new
    expect(board.board).to eq ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  it "should return available spaces in an array" do
    board = Board.new
    board[1] = 'X'
    board[5] = 'O'
    expect(board.available_spaces('X', 'O')).to eq ["0", "2", "3", "4", "6", "7", "8"]
  end
end

describe "Player" do
  before :each do
    @board = Board.new
    @human = Human.new
  end
  it "as a human should be able to pick a spot on an empty board" do
    @human.get_human_spot(@board, "X", 4)
    expect(@board.board).to eq ["0", "1", "2", "3", "O", "5", "6", "7", "8"]
  end  
  it "should only accept 0-8 for spot input"do
    expect(@human.get_human_spot(@board, "X", 9)).to eq nil
  end
  it "should accept non digit characters"do
    expect(@human.get_human_spot(@board, "X", 'f')).to eq nil
  end
  it "should only allow user to choose empty spot"do
    
  end
end
