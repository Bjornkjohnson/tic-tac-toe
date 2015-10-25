require_relative 'game'

describe "Tic Tac Toe" do
  it "should generate a board" do
    game = Game.new
    expect(game.board).to eq ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end
  it "should only accept 1-8 for spot input"
  it "should never let the user win"
  it "should display whos turn it is"
  it "should display what spot a user chose"
  it "should allow users to choose game type"
  it "should allow user to choose who goes first"
  it "allow user to choose marker"

      

end



