class Player
  attr_accessor :symbol, :name

  def initialize(symbol, name = nil)
    @symbol = symbol
    @name = name
  end
end
