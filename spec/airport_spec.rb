require 'airport'

describe Airport do
  subject(:airport) { described_class.new() }
  let(:plane) { double :plane }

  describe '#land' do
    it 'instructs a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
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

  describe '#take_off' do
    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
    context 'when stormy' do
      it 'take off raises an error' do
        allow(airport).to receive(:stormy?).and_return true
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
      airport = described_class.new random_capacity
      expect(airport.capacity).to eq random_capacity
    end
  end

end
