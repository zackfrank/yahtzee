require_relative "scorecard.rb"

class Categories

  def ones(scorecard, dice)
  end

  def twos(scorecard, dice)
  end

  def threes(scorecard, dice)
  end

  def fours(scorecard, dice)
  end

  def fives(scorecard, dice)
  end

  def sixes(scorecard, dice)
  end

  def bonus(scorecard)
    if scorecard.part_one_total >= 63
      scorecard.bonus = 35
    end
  end

  def three_of_a_kind(scorecard, dice)
  end

  def four_of_a_kind(scorecard, dice)
  end

  def full_house(scorecard, dice)
  end

  def small_straight(scorecard, dice)
  end

  def large_straight(scorecard, dice)
  end

  def yahtzee(scorecard, dice)
  end

  def chance(scorecard, dice)
  end

end