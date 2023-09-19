# frozen_string_literal: true

# test
class GameStart
  attr_reader :choice, :player_one_name, :player_one_symbol, :player_two_symbol, :computer_symbol

  def initialize
    @player_one_symbol = 'X'
    @player_two_symbol = 'O'
    @computer_symbol = 'O'
  end

  def greetings
    puts 'Please insert your name'
    @player_one_name = gets.chomp
    puts "Hello, #{@player_one_name}! Would you like to play against another player, or against the computer?"
    puts "Press '1' for Computer, or '2' for Another Player."
  end

  def choose_players
    p @choice = gets.chomp
    if @choice == '1'
      puts 'Computer it is!'
    elsif @choice == '2'
      puts 'Another player it is!'
    else
      puts "Not a valid entry. Please choose between '1' or '2'."
      puts "Press '1' for Computer, or '2' for Another Player."
      choose_players
    end
  end

  def prepare_players_symbols
    puts "#{@player_one_name}, please type what symbol you'd like to play with. The default value is 'X'."
    @player_one_symbol = gets.chomp
    if @choice == '1'
      puts "Please type what symbol you'd like the computer to play with. The default value is 'O'."
      @computer_symbol = gets.chomp
    elsif @choice == '2'
      puts 'Player 2, please insert your name'
      @player_two_name = gets.chomp
      puts "#{@player_two_name}, please type what symbol you'd like to play with. The default value is 'X'."
      @player_two_symbol = gets.chomp
    end
  end
end

# asd
class Game
  attr_accessor :game_board, :player_scores

  def initialize(player_one_symbol, player_two_symbol, computer_symbol)
    @winning_scores = [[1, 2, 3], [1, 5, 9], [1, 4, 7], [4, 5, 6], [7, 5, 3], [7, 8, 9], [2, 5, 8], [3, 6, 9]]
    @game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @player_scores = []
    @player_one_symbol = player_one_symbol
    @player_two_symbol = player_two_symbol
    @computer_symbol = computer_symbol
  end

  def capture_keypress
    puts 'Please pick one slot to fill.'
    keypress = gets.chomp.to_i
    if @game_board.include?(keypress) == true
      @game_board.delete_at(keypress - 1)
      @game_board.insert(keypress - 1, @player_one_symbol)
      @player_scores.push(keypress)
      @player_scores = @player_scores.sort
      display_game_board
    else
      puts 'Invalid option. Please pick a free slot to fill.'
    end
  end

  def update_scores
    until @player_scores.length == 5
      capture_keypress
      if @winning_scores.any? { |winning_combination| (winning_combination - @player_scores).empty? }
        puts 'You win!'
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

newgame = GameStart.new
newgame.greetings
newgame.choose_players
newgame.prepare_players_symbols

newmatch = Game.new(newgame.player_one_symbol, newgame.player_two_symbol, newgame.computer_symbol)
newmatch.display_game_board
newmatch.capture_keypress
newmatch.update_scores
