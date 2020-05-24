class Airport

  DEFAULT_CAPACITY = 30

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Deniend landing; airport full' if @planes.count >= @capacity
    @planes << plane
  end

  def take_off(plane)

  end

end
