require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  describe '#land' do
    it { is_expected.to respond_to :land  }
    it 'raises an error' do
      plane.land
      expect { plane.land }.to raise_error 'Plane cannot land; plane already landed'
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to :take_off  }
    it 'raises an error' do
      expect { plane.take_off }.to raise_error 'Plane cannot take off; plane already flying'
    end
  end

  describe '#airport' do
    it { is_expected.to respond_to :airport  }
    it 'raises an error' do
      expect { plane.airport }.to raise_error 'Plane cannot be at airport; plane already flying'
    end
  end

end
