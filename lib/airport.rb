class Airport

  DEFAULT_CAPACITY = 30

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather_forecast)
    @capacity = capacity
    @weather_forecast = weather_forecast
    @planes = []
  end

  def land(plane)
    raise 'Denied landing; stormy weather' if stormy?
    raise 'Deniend landing; airport full' if full?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    raise 'Denied takeoff; stormy weather' if stormy?
    raise 'Plane cannot take off; plane not at this airport' unless at_airport?(plane)
    confirm_departure_of(plane)
    plane
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    @weather_forecast.stormy?
  end

  def at_airport?(plane)
    @planes.include? plane
  end

  def confirm_departure_of(plane)
    @planes -= [plane]
    return 'Confirmed departure of plane' unless at_airport? plane
  end

end
