require_relative "../lib/board"

RSpec.describe Board do
  describe "#valid_move?" do
    it "returns false if the spot is already taken" do
      board = Board.new
      board.grid = [["X", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
      expect(board.valid_move?("1")).to eq(false)
    end

    (1..9).each do |pos|
      it "returns true if spot #{pos} is empty" do
        board = Board.new
        board.grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
        expect(board.valid_move?(pos.to_s)).to eq(true)   # pass string
      end
    end

    it "returns false if the spot is already taken by O" do
      board = Board.new
      board.grid = [["O", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
      expect(board.valid_move?("1")).to eq(false)
    end

    it "returns false if the spot is already taken by X" do
      board = Board.new
      board.grid = [["X", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
      expect(board.valid_move?("1")).to eq(false)
    end

    it "returns false if the spot number is out of range" do
      board = Board.new
      board.grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
      expect(board.valid_move?("10")).to eq(false)
    end

    it "returns false if the spot is not a number" do
      board = Board.new
      board.grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
      expect(board.valid_move?("abc")).to eq(false)
    end
  end

  describe "#move" do
    it "places the player's symbol in the chosen spot" do
      board = Board.new
      board.grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]

      result = board.move("1", "X")

      expect(board.grid[0][0]).to eq("X")   # top-left updated
      expect(result).to eq(true)            # returns true on success
    end
    it "places the player's symbol in the center spot" do
      board = Board.new
      board.grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]

      result = board.move("5", "O")

      expect(board.grid[1][1]).to eq("O")   # center updated
      expect(result).to eq(true)
    end

    it "places the player's symbol in the last row, last column" do
      board = Board.new
      board.grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]

      result = board.move("9", "X")

      expect(board.grid[2][2]).to eq("X")   # bottom-right updated
      expect(result).to eq(true)
    end

    it "does not overwrite a taken spot and returns false" do
      board = Board.new
      board.grid = [["X", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]

      result = board.move("1", "O")

      expect(board.grid[0][0]).to eq("X")   # still X, unchanged
      expect(result).to eq(false)
    end
  end

  describe "#winner" do
    it "returns 'X' when the top row is all X" do
      board = Board.new
      board.grid = [["X", "X", "X"], ["4", "5", "6"], ["7", "8", "9"]]
      expect(board.winner).to eq("X")
    end

    it "returns 'O' when the middle row is all O" do
      board = Board.new
      board.grid = [["1", "2", "3"], ["O", "O", "O"], ["7", "8", "9"]]
      expect(board.winner).to eq("O")
    end

    it "returns 'X' when the left column is all X" do
      board = Board.new
      board.grid = [["X", "2", "3"], ["X", "5", "6"], ["X", "8", "9"]]
      expect(board.winner).to eq("X")
    end

    it "returns 'X' when the main diagonal is all X" do
      board = Board.new
      board.grid = [["X", "2", "3"], ["4", "X", "6"], ["7", "8", "X"]]
      expect(board.winner).to eq("X")
    end

    it "returns 'O' when the anti-diagonal is all O" do
      board = Board.new
      board.grid = [["1", "2", "O"], ["4", "O", "6"], ["O", "8", "9"]]
      expect(board.winner).to eq("O")
    end

    it "returns nil when there is no winner" do
      board = Board.new
      board.grid = [["X", "O", "X"], ["O", "X", "O"], ["O", "X", "O"]]
      expect(board.winner).to be_nil
    end
  end
end
