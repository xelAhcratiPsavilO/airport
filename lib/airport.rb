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
    @weather_forecast.stormy?
  end

  def confirm_departure_of(plane)
    return "Confirmed departure of #{plane}." unless @planes.include? plane
  end

end
