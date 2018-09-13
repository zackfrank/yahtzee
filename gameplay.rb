require_relative 'dice.rb'
require_relative 'scorecard.rb'
require_relative 'categories.rb'

class Gameplay

  def initialize
    @dice = Dice.new
    @scorecard = Scorecard.new
    @categories = Categories.new
    @round = 1
  end

  def start
    system "clear"
    puts "~*----*~*---*~ Welcome to Yahtzee!!!!!! ~*---*~*----*~"
    puts
    puts "[Enter] to continue."
    gets.chomp
    roll_one
  end

  def roll_one
    system "clear"
    print "[Enter] to take your first roll for Round #{@round}"
    gets.chomp
    puts
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
    puts
    @dice.display
    puts
    puts "Which would you like to re-roll?"
    puts "[1] for all"
    puts "[2] for none"
    puts "[3] to select"
    choice = gets.chomp.to_i
    if choice == 1
      @dice = Dice.new
    elsif choice == 2
      select_category
    elsif choice == 3
      select_dice_to_reroll
    end
    select_category
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
    system "clear"
    puts "Your Final Roll:"
    @dice.display
    puts
    puts "---- Categories ----"
    puts "[1] Ones"
    puts "[2] Twos"
    puts "[3] Threes"
    puts "[4] Fours"
    puts "[5] Fives"
    puts "[6] Sixes"
    puts "[7] Three-of-a-Kind"
    puts "[8] Four-of-a-Kind"
    puts "[9] Full House"
    puts "[10] Small Straight"
    puts "[11] Large Straight"
    puts "[12] YAHTZEE"
    puts "[13] Chance"
    puts
    print "Selection: "
    choice = gets.chomp.to_i
    if choice == 1
      @categories.ones(@scorecard, @dice.roll)
    elsif choice == 2
      @categories.twos(@scorecard, @dice.roll)
    elsif choice == 3
      @categories.threes(@scorecard, @dice.roll)
    end
  end

  def end_game
    puts "[Enter] to end the game"
    puts "[1] to play again"
    choice = gets.chomp.to_i
    if choice == 1
      Game.new
      Game.start
    end
  end
  
end