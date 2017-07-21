class Player
  attr_reader :name
  attr_accessor :points

  DEFAULT_POINTS = 60
  def initialize(name)
    @name = name
    @points = DEFAULT_POINTS
  end

  def reduce_points
    damage = rand(1..15)
    p damage
    self.points -= damage
  end

  def default_points
    DEFAULT_POINTS
  end
end
