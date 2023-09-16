# frozen_string_literal: true

# test
class GameStart
  def self.greetings
    puts 'Please insert your name'
    name = gets.chomp
    puts "Hello, #{name}! Would you like to play against another player, or against the computer?"
    puts "Press '1' for Computer, or '2' for Another Player."
  end
end

# test2
class DisplayBoard
  def self.starter_board
    puts ''
    puts '        |       |       '
    puts '    1   |   2   |   3   '
    puts ' _______|_______|_______'
    puts '        |       |       '
    puts '    4   |   5   |   6   '
    puts ' _______|_______|_______'
    puts '        |       |       '
    puts '    7   |   8   |   9   '
    puts '        |       |       '
  end
end

GameStart.greetings
DisplayBoard.starter_board
