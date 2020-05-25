class Airport

  DEFAULT_CAPACITY = 30

  attr_reader :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY, weather_forecast)
    @capacity = capacity
    @weather_forecast = weather_forecast
    @planes = []
  end

  def land(plane)
    raise 'Denied landing; stormy weather' if stormy?
    raise 'Deniend landing; airport full' if full?
    plane.land(self)
    add_plane(plane)
  end

  def take_off(plane)
    raise 'Denied takeoff; stormy weather' if stormy?
    raise 'Plane cannot take off; plane not at this airport' unless at_airport?(plane)
    confirm_departure_of(plane)
    plane
  end

  private

  attr_reader :weather_forecast

  def full?
    planes.count >= @capacity
  end

  def add_plane(plane)
    planes << plane
  end

  def remove_plane(plane)
    @planes -= [plane]
  end

  def stormy?
    weather_forecast.stormy?
  end

  def at_airport?(plane)
    planes.include? plane
  end

  def confirm_departure_of(plane)
    remove_plane(plane)
    plane.take_off
    return 'Confirmed departure of plane' unless at_airport? plane
  end

end
