require 'weather_forecast'

describe WeatherForecast do
  subject(:weather_forecast) { described_class.new() }

  describe '#stormy?' do
    context 'when stormy' do
      it 'is true' do
        allow(Kernel).to receive(:rand).and_return 0
        expect(weather_forecast.stormy?).to be true
      end
    end
    context 'when non-stormy' do
      it 'is false' do
        allow(Kernel).to receive(:rand).and_return 1
        expect(weather_forecast.stormy?).to be false
      end
    end
  end

end
