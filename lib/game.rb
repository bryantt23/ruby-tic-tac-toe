require_relative "board"
require_relative "player"
require_relative "view"

class Game
  def initialize()
    @board = Board.new
    @view = View.new
    @player_x = Player.new("X")
    @player_o = Player.new("O")
    @current_player = @player_x
    @current_game_over = false
  end

  def start_game
    puts @view.show_welcome()
    # outer loop → keeps running until user chooses to exit
    continue_game = true
    while continue_game
      # reset the board for a new game
      @board = Board.new
      # reset current player to Player X
      @current_player = @player_x
      # loop until board says game is over
      while @current_game_over == false
        # call play_one_game
        play_one_game
      end

      # game has ended → show final board
      puts @view.show_board(@board.grid)

      # show the winner (or tie)
      puts @view.show_winner(@board.winner)

      # ask user if want to keep playing
      continue_game = play_again?()
    end
  end

  private

  def play_again?
    @view.show_replay_prompt()
    while user_input = gets.chomp
      case user_input
      when "X", "x"
        return false
      when "\n"
        return true
      else
        @view.show_replay_prompt()
      end
    end
  end

  def play_one_game
    # show the board
    puts @view.show_board(@board.grid)
    # inner loop: keep asking until move is valid
    player_move
    # switch to the other player
    switch_player
    # end until loop
    @current_game_over = @board.game_over?()
    puts "current game over #{@current_game_over}"
  end

  def switch_player
    puts "switch player before #{@current_player.symbol}"
    # if current player is X, switch to O
    @current_player = @current_player == @player_x ? @player_o : @player_x
    puts "switch player after #{@current_player.symbol}"
  end

  def player_move
    # get input from user
    have_valid_move = false
    while have_valid_move == false
      # show which player's turn it is
      puts @view.show_player_turn(@current_player.symbol)
      user_input = gets.chomp
      # attempt to make move on board
      have_valid_move = @board.move(user_input, @current_player.symbol)
      puts have_valid_move
    end
  end
end

g = Game.new
g.start_game
