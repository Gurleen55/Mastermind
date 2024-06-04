require "rubocop"

# module for computer  to make secret code
module SecretCode
  def make_secret_code
    @colors = %w[red green blue black orange pink white yellow brown violet]
    colors.sample(4)
  end

  def self.included(base)
    base.class_eval do
      attr_accessor :colors
    end
  end
end

# this class will create the mastermind game
class Game
  include SecretCode

  def initialize
    @colors = %w[red green blue black orange pink white yellow brown violet]
  end

  def start_mastermind
    puts "Following color will be the part of the secret code #{@colors}, it will consist of 4 colors"
    @secret_code = make_secret_code
    puts @secret_code
    puts "Try to guess the code now"
    user_guesses
    check_guesses
  end

  def user_guesses
    @player_guess = []
    4.times do |i|
      puts "Guess #{i + 1}: "
      guess = gets.strip
      @player_guess.push(guess)
    end
  end

  def check_guesses
    @number_of_correct_guesses =
      @player_guess.reduce(0) do |acc, cur|
        acc += 1 if @secret_code.include?(cur)
        acc
      end
    puts "number of correct guesses are: #{@number_of_correct_guesses}"
  end
end

game = Game.new
game.start_mastermind
