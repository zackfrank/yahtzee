class Scorecard

  def initialize
    @scorecard = {
      ones: 0,
      twos: 0,
      threes: 0,
      fours: 0,
      fives: 0,
      sixes: 0,
      three_of_a_kind: 0,
      four_of_a_kind: 0,
      full_house: 0,
      small_straight: 0,
      large_straight: 0,
      yahtzee: 0,
      chance: 0
    }
    @bonus = 0
  end

  def scorecard
    @scorecard
  end

  def bonus
    @bonus
  end

  def is_full
    all_scores = @scorecard.values
    return false if all_scores.any? 0
  end

  def part_one_total
    @scorecard[:ones] + @scorecard[:twos] + @scorecard[:threes] + @scorecard[:fours] + @scorecard[:fives] + @scorecard[:sixes]
  end

end