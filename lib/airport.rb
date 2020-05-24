class Airport

  DEFAULT_CAPACITY = 30

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Deniend landing; airport full' if full?
    @planes << plane
  end

  def take_off(plane)
    raise 'Denied takeoff; stormy weather' if stormy?
    @planes -= [plane]
    confirm_departure_of(plane)
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    rand(4).zero?
  end

  def confirm_departure_of(plane)
    return "Confirmed departure of #{plane}." unless @planes.include? plane
  end

end
