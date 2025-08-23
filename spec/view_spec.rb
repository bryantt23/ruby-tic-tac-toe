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
  describe "#show_replay_prompt" do
    it "returns the replay message" do
      view = View.new
      expect(view.show_replay_prompt).to eq("Press Enter to play again or X to exit")
    end
  end

  describe "#show_board" do
    it "renders the starting board with numbers 1-9" do
      view = View.new
      grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]

      expected = "1 | 2 | 3\n" \
                 "---------\n" \
                 "4 | 5 | 6\n" \
                 "---------\n" \
                 "7 | 8 | 9"

      expect(view.show_board(grid)).to eq(expected)
    end

    it "renders a mid-game board with X and O placed" do
      view = View.new
      grid = [["X", "2", "3"], ["4", "O", "6"], ["7", "8", "9"]]

      expected = "X | 2 | 3\n" \
                 "---------\n" \
                 "4 | O | 6\n" \
                 "---------\n" \
                 "7 | 8 | 9"

      expect(view.show_board(grid)).to eq(expected)
    end

    it "renders a full board" do
      view = View.new
      grid = [["X", "O", "X"], ["O", "X", "O"], ["O", "X", "X"]]

      expected = "X | O | X\n" \
                 "---------\n" \
                 "O | X | O\n" \
                 "---------\n" \
                 "O | X | X"

      expect(view.show_board(grid)).to eq(expected)
    end
  end
end
