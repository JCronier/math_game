class Player
  def initialize id
    @id = id
    @lives = 3
  end

  def lose_life
    @lives = @lives - 1
  end

  attr_reader :id
  attr_reader :lives
end
