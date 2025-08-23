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

  def show_replay_prompt
    "Press Enter to play again or X to exit"
  end

  def show_board(grid)
    grid.map do |row|
      row.join(" | ")
    end.join("\n---------\n")
  end
end
