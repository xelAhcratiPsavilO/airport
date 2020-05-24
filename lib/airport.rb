class Airport

  def initialize(capacity)
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
