require_relative "../lib/board"

RSpec.describe Board do
  describe "#valid_move?" do
    it "returns false if the spot is already taken" do
      board = Board.new
      board.grid = [["X", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]  # position 1 already filled
      expect(board.valid_move?(1)).to eq(false)
    end

    it "returns true if the spot is empty" do
      board = Board.new
      board.grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]  # fresh grid
      expect(board.valid_move?(1)).to eq(true)
    end

    it "returns true if the spot is empty (2)" do
      board = Board.new
      board.grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
      expect(board.valid_move?(2)).to eq(true)
    end

    it "returns true if the spot is empty (3)" do
      board = Board.new
      board.grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
      expect(board.valid_move?(3)).to eq(true)
    end

    it "returns true if the spot is empty (4)" do
      board = Board.new
      board.grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
      expect(board.valid_move?(4)).to eq(true)
    end

    it "returns true if the spot is empty (5)" do
      board = Board.new
      board.grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
      expect(board.valid_move?(5)).to eq(true)
    end

    it "returns true if the spot is empty (6)" do
      board = Board.new
      board.grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
      expect(board.valid_move?(6)).to eq(true)
    end

    it "returns true if the spot is empty (7)" do
      board = Board.new
      board.grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
      expect(board.valid_move?(7)).to eq(true)
    end

    it "returns true if the spot is empty (8)" do
      board = Board.new
      board.grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
      expect(board.valid_move?(8)).to eq(true)
    end

    it "returns true if the spot is empty (9)" do
      board = Board.new
      board.grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
      expect(board.valid_move?(9)).to eq(true)
    end
  end
end
