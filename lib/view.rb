class View
  def show_welcome
    "Welcome to Tic Tac Toe!"
  end

  def show_player_turn(player)
    "Player #{player}, make your move"
  end

  def show_winner(winner)
    if winner == :tie
      return "It was a Tie"
    end
    "#{winner} wins!"
  end
end
