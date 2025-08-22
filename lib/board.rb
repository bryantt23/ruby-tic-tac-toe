class Board
  attr_accessor :grid

  def initialize
    @grid = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
  end

  def valid_move?(position)
    if position.to_i < 0 || position.to_i > 9 || position.to_i.to_s != position
      return false
    end
    index = position.to_i - 1
    row = index / @grid.length
    column = index % @grid.length
    value = @grid[row][column]
    value != "X" && value != "O"
  end
end
