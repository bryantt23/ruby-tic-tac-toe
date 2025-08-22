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

  def move(position, mark)
    return false unless valid_move?(position)

    index = position.to_i - 1
    row = index / @grid.length
    column = index % @grid.length
    @grid[row][column] = mark
    true
  end

  def winner
    @grid.each do |row|
      if row.uniq.count == 1
        return row[0]
      end
    end

    transposed_grid = @grid.transpose
    transposed_grid.each do |row|
      if row.uniq.count == 1
        return row[0]
      end
    end

    diagonal_right = (0...@grid.length).map do |i|
      @grid[i][i]
    end
    if diagonal_right.uniq.count == 1
      return diagonal_right[0]
    end

    diagonal_left = (0...@grid.length).map do |i|
      @grid[i][@grid.length - i - 1]
    end
    if diagonal_left.uniq.count == 1
      return diagonal_left[0]
    end
  end

  def game_over?
    if winner
      return true
    end

    @grid.flatten.all? { |elem| elem == "X" || elem == "O" }
  end
end
