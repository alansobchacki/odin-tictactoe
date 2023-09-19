# frozen_string_literal: true

# test
class GameStart
  def self.greetings
    puts 'Please insert your name'
    name = gets.chomp
    puts "Hello, #{name}! Would you like to play against another player, or against the computer?"
    puts "Press '1' for Computer, or '2' for Another Player."
  end

  def self.game_mode
    p choice = gets.chomp
    if choice == '1'
      puts 'Computer it is!'
    elsif choice == '2'
      puts 'Another player it is!'
    else
      puts "Not a valid entry. Please choose between '1' or '2'."
      puts "Press '1' for Computer, or '2' for Another Player."
      game_mode
    end
  end
end

# asd
class Scores
  @winning_scores = [[1, 2, 3], [1, 5, 9], [1, 4, 7], [4, 5, 6], [7, 5, 3], [7, 8, 9], [2, 5, 8], [3, 6, 9]]
  @game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  @player_scores = []

  def self.update_scores
    until @player_scores.length == 5
      capture_keypress
      display_board
      if @winning_scores.any? { |winning_combination| (winning_combination - @player_scores).empty? }
        puts 'You win!'
        break
      end
    end
  end

  def self.capture_keypress
    puts 'Please pick one slot to fill.'
    keypress = gets.chomp.to_i
    if @game_board.include?(keypress) == true
      @game_board.delete_at(keypress - 1)
      @game_board.insert(keypress - 1, 'X')
      @player_scores.push(keypress)
      @player_scores = @player_scores.sort
    else
      puts 'Invalid option. Please pick a free slot to fill.'
    end
  end

  def self.display_board
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

GameStart.greetings
GameStart.game_mode
Scores.update_scores
