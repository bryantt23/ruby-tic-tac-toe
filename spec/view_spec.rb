require_relative "../lib/view"

RSpec.describe View do
  describe "#show_welcome" do
    it "returns the welcome message" do
      view = View.new
      expect(view.show_welcome).to eq("Welcome to Tic Tac Toe!")
    end
  end
  describe "#show_player_turn" do
    it "returns the prompt for player X" do
      view = View.new
      expect(view.show_player_turn("X")).to eq("Player X, make your move")
    end

    it "returns the prompt for player O" do
      view = View.new
      expect(view.show_player_turn("O")).to eq("Player O, make your move")
    end
  end
  describe "#show_winner" do
    it "returns 'X wins!' when given 'X'" do
      view = View.new
      expect(view.show_winner("X")).to eq("X wins!")
    end

    it "returns 'O wins!' when given 'O'" do
      view = View.new
      expect(view.show_winner("O")).to eq("O wins!")
    end

    it "returns 'It was a Tie' when given :tie" do
      view = View.new
      expect(view.show_winner(:tie)).to eq("It was a Tie")
    end
  end
end
