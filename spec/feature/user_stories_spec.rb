describe 'User Stories' do
  let (:airport) { Airport.new(weather_forecast) }
  let (:small_airport) { Airport.new(20, weather_forecast) }
  let(:weather_forecast) { WeatherForecast.new }
  let (:plane) { Plane.new }
  rand_capacity = Random.rand(100)
  let (:airport_with_rand_capacity) { Airport.new(rand_capacity, weather_forecast) }

  context 'when non-stormy' do
    before do
      allow(weather_forecast).to receive(:stormy?).and_return false
    end
    # As an air traffic controller
    # So I can get passengers to a destination
    # I want to instruct a plane to land at an airport
    it 'airport instructs a plane to land' do
      expect { airport.land(plane) }.not_to raise_error
    end
    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it 'airport instructs a plane to take off' do
      airport.land(plane)
      expect { airport.take_off(plane) }.not_to raise_error
    end
    it 'airport checks that an plane has departured' do
      airport.land(plane)
      expect(airport).to receive :confirm_departure_of
      airport.take_off(plane)
    end
    it 'airport returns the plane that took off' do
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane
    end
    it 'planes take off only from airports they are at' do
      small_airport.land(plane)
      expect { airport.take_off(plane) }.to raise_error 'Plane cannot take off; plane not at this airport'
    end
    # As the system designer
    # So that the software can be used for many different airports
    # I would like a default airport capacity that can be overridden as appropriate
    it 'airport has a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'airport has a default capacity which can be overridden' do
      expect(airport_with_rand_capacity.capacity).to eq rand_capacity
    end
    it 'flying planes cannot take off' do
      airport.land plane
      flying_plane = airport.take_off(plane)
      expect { flying_plane.take_off }.to raise_error 'Plane cannot take off; plane already flying'
    end
    context 'when full' do
      # As an air traffic controller
      # To ensure safety
      # I want to prevent landing when the airport is full
      it 'landings are not allowed' do
        20.times do
          small_airport.land(plane)
        end
        expect { small_airport.land(plane) }.to raise_error 'Deniend landing; airport full'
      end
    end
  end

  context 'when stormy' do
    before do
      allow(weather_forecast).to receive(:stormy?).and_return true
    end
    # As an air traffic controller
    # To ensure safety
    # I want to prevent takeoff when weather is stormy
    it 'takeoffs not allowed' do
      expect { airport.take_off(plane) }.to raise_error 'Denied takeoff; stormy weather'
    end
    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when weather is stormy
    it 'landings not allowed' do
      expect { airport.land(plane) }.to raise_error 'Denied landing; stormy weather'
    end
  end
end
