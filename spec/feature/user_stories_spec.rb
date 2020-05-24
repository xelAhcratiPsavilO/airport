describe 'User Stories' do
  let (:airport) { Airport.new }
  let (:small_airport) { Airport.new(20) }
  let (:plane) { Plane.new }
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
    allow(airport).to receive(:stormy?).and_return false
    expect { airport.take_off(plane) }.not_to raise_error
  end
  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full
  it 'landings not allowed when airport is full' do
    20.times do
      small_airport.land(plane)
    end
    expect { small_airport.land(plane) }.to raise_error 'Deniend landing; airport full'
  end
  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate
  it 'airport has a default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it 'default capacity of the airport can be overridden' do
    random_capacity = Random.rand(100)
    airport = Airport.new(random_capacity)
    expect(airport.capacity).to eq random_capacity
  end
  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy
  it 'takeoffs not allowes when wheather is stormy' do
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.take_off(plane) }.to raise_error 'Denied takeoff; stormy weather'
  end
end
