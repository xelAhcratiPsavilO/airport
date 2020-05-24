describe 'User Stories' do
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  it 'airport instructs a plane to land' do
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end
  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it 'airport instructs a plane to take off' do
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end
  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full
  it 'landings not allowed when airport is full' do
    airport = Airport.new(20)
    plane = Plane.new
    20.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error 'Deniend landing; airport full'
  end
  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate
  it 'airport has a default capacity' do
    airport = Airport.new()
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it 'default capacity of the airport can be overridden' do
    random_capacity = Random.rand(100)
    airport = Airport.new(random_capacity)
    expect(airport.capacity).to eq random_capacity
  end
end
