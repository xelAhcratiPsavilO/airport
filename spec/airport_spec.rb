require 'airport'

describe Airport do
  subject(:airport) { described_class.new(weather_forecast) }
  let(:plane) { double :plane, land: nil }
  let(:weather_forecast) { double :weather_forecast }

  describe '#land' do
    context 'when non-stormy' do
      before do
        allow(weather_forecast).to receive(:stormy?).and_return false
      end
      it 'instructs a plane to land' do
        expect(plane).to receive :land
        airport.land(plane)
      end
      context 'when full' do
        it 'raises an error' do
          described_class::DEFAULT_CAPACITY.times do
            airport.land(plane)
          end
          expect { airport.land(plane) }.to raise_error 'Deniend landing; airport full'
        end
      end
    end
    context 'when stormy' do
      before do
        allow(weather_forecast).to receive(:stormy?).and_return true
      end
      it 'raises an error' do
        expect { airport.land(plane) }.to raise_error 'Denied landing; stormy weather'
      end
    end
  end

  describe '#take_off' do
    context 'when non-stormy' do
      before do
        allow(weather_forecast).to receive(:stormy?).and_return false
      end
      it 'instructs a plane to take off' do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
      it 'confirms departure' do
        airport.land(plane)
        expect(airport).to receive :confirm_departure_of
        airport.take_off(plane)
      end
      it 'returns the plane that took off' do
        airport.land(plane)
        expect(airport.take_off(plane)).to eq plane
      end
      context 'when plane not at this airport' do
        it 'raises an error' do
          small_airport = described_class.new(20, weather_forecast)
          small_airport.land(plane)
          expect { airport.take_off(plane) }.to raise_error 'Plane cannot take off; plane not at this airport'
        end
      end
    end
    context 'when stormy' do
      before do
        allow(weather_forecast).to receive(:stormy?).and_return true
      end
      it 'raises an error' do
        expect { airport.take_off(plane) }.to raise_error 'Denied takeoff; stormy weather'
      end
    end
  end

  describe '#capacity' do
    it 'has a default value' do
      expect(airport.capacity).to eq described_class::DEFAULT_CAPACITY
    end
    it 'can be overridden' do
      random_capacity = Random.rand(100)
      airport = described_class.new random_capacity, weather_forecast
      expect(airport.capacity).to eq random_capacity
    end
  end

end
