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
end
