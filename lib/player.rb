class Player
  attr_reader :name, :hp

  def initialize(name, hp = 100)
    @name = name
    @hp   = hp
  end

  def take_damage(points)
    @hp -= points
  end

  def dead?
    hp <= 0
  end
end
