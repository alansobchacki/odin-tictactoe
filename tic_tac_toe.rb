# frozen_string_literal: true

# will write documentation later
class SetUpGame
  attr_reader :player_one_name, :player_one_symbol, :player_two_name, :player_two_symbol

  def initialize
    @player_one_symbol = 'X'
    @player_two_symbol = 'O'
  end

  def greetings
    puts 'Welcome to my amazingly-coded game of Tic-Tac-Toe!'

    puts 'Player 1, please insert your name'
    @player_one_name = gets.chomp
    puts "#{@player_one_name}, please type what symbol you'd like to play with. The default value is 'X'."
    @player_one_symbol = gets.chomp

    puts 'Player 2, please insert your name'
    @player_two_name = gets.chomp
    puts "#{@player_two_name}, please type what symbol you'd like to play with. The default value is 'O'."
    @player_two_symbol = gets.chomp
    puts 'Good luck, everyone!'
  end
end

# will write documentation later
class Game
  attr_accessor :game_board, :player_scores, :player_one_scores, :player_one_symbol, :player_two_scores,
                :player_two_symbol

  def initialize(player_one_symbol, player_two_symbol, player_one_name, player_two_name)
    @winning_scores = [[1, 2, 3], [1, 5, 9], [1, 4, 7], [4, 5, 6], [7, 5, 3], [7, 8, 9], [2, 5, 8], [3, 6, 9]]
    @game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @player_one_scores = []
    @player_two_scores = []
    @player_one_symbol = player_one_symbol
    @player_two_symbol = player_two_symbol
    @player_one_name = player_one_name
    @player_two_name = player_two_name
  end

  def multiplayer_match(player, symbol)
    puts 'Please pick one slot to fill.'
    keypress = gets.chomp.to_i
    if @game_board.include?(keypress) == true
      @game_board.delete_at(keypress - 1)
      @game_board.insert(keypress - 1, symbol)
      player.push(keypress)
      player = player.sort
      display_game_board
    else
      puts 'Invalid option. Please try again.'
      multiplayer_match(player, symbol)
    end
  end

  def update_scores(player_one, player_one_symbol, player_two, player_two_symbol)
    until @player_one_scores.length == 5 || @player_two_scores.length == 5
      multiplayer_match(player_two, player_two_symbol)
      if @winning_scores.any? { |winning_combination| (winning_combination - @player_two_scores).empty? }
        puts "#{@player_two_name} wins!"
        break
      end
      multiplayer_match(player_one, player_one_symbol)
      if @winning_scores.any? { |winning_combination| (winning_combination - @player_one_scores).empty? }
        puts "#{@player_one_name} wins!"
        break
      end
    end
  end

  def display_game_board
    puts ''
    puts '        |       |       '
    puts "    #{@game_board[0]}   |   #{@game_board[1]}   |   #{@game_board[2]}   "
    puts ' _______|_______|_______'
    puts '        |       |       '
    puts "    #{@game_board[3]}   |   #{@game_board[4]}   |   #{@game_board[5]}   "
    puts ' _______|_______|_______'
    puts '        |       |       '
    puts "    #{@game_board[6]}   |   #{@game_board[7]}   |   #{@game_board[8]}   "
    puts '        |       |       '
    puts ''
  end
end

newgame = SetUpGame.new
newgame.greetings

match = Game.new(newgame.player_one_symbol, newgame.player_two_symbol,
                 newgame.player_one_name, newgame.player_two_name)
match.display_game_board
match.multiplayer_match(match.player_one_scores, newgame.player_one_symbol)
match.update_scores(match.player_one_scores, match.player_one_symbol,
                    match.player_two_scores, match.player_two_symbol)
