require_relative 'dice.rb'
require_relative 'scorecard.rb'
require_relative 'rules.rb'

class Gameplay

  def initialize
    @dice = Dice.new
    @scorecard = Scorecard.new
    @round = 1
  end

  def start
    system "clear"
    puts "Welcome to Yahtzee!!!!!!"
    puts
    roll_one
  end

  def roll_one
    print "Type any key to take your first roll for Round #{@round}"
    gets.chomp
    @dice.display
    puts
    puts "Which would you like to re-roll?"
    puts "[1] for all"
    puts "[2] for none"
    puts "[3] to select"
    choice = gets.chomp.to_i
    if choice == 1
      @dice = Dice.new
      roll_two
    elsif choice == 2
      select_category
    elsif choice == 3
      select_dice_to_reroll
      roll_two
    end
  end
  
  def roll_two
    system "clear"
    puts "Roll Two:"
    @dice.display
    puts
    puts "Which would you like to re-roll?"
    puts "[1] for all"
    puts "[2] for none"
    puts "[3] to select"
    choice = gets.chomp.to_i
    if choice == 1
      @dice = Dice.new
      roll_three
    elsif choice == 2
      select_category
    elsif choice == 3
      select_dice_to_reroll
      roll_three
    end
  end

  def roll_three
    system "clear"
    puts "Roll Three, Final Roll for Round #{@round}:"
    @dice.display
    puts
    select_category
    next_round
  end

  def next_round
    if @scorecard.is_full
      end_game
    else
      @round += 1
      roll_one
    end
  end

  def select_dice_to_reroll
    puts "Which dice would you like to re-roll? Type integers and separate with a comma."
    dice_to_reroll = gets.chomp.split
    dice_to_reroll.each do |die|
      die = die.to_i - 1
      @dice.reroll(die)
    end
  end

  def select_category
  end

  def end_game
    puts "[Any Key] to end the game"
    puts "[1] to play again"
    choice = gets.chomp.to_i
    if choice == 1
      Game.new
      Game.start
    end
  end
  
end