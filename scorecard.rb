class Scorecard

  def initialize
    @scorecard = {
      ones: nil,
      twos: nil,
      threes: nil,
      fours: nil,
      fives: nil,
      sixes: nil,
      bonus: nil,
      three_of_a_kind: nil,
      four_of_a_kind: nil,
      full_house: nil,
      small_straight: nil,
      large_straight: nil,
      yahtzee: nil,
      chance: nil,
    }
  end

  def is_full
    return false if @scorecard
  end

end

scorecard = Scorecard.new