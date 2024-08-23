require 'rails_helper'

describe Weather::MinTempSpreadCalculator do
  context 'when there is weather information' do
    let(:weather) do
      {
        1 => { min_temp: 0, max_temp: 100, temp_spread: 100 },
        2 => { min_temp: 30, max_temp: 40, temp_spread: 10 },
        3 => { min_temp: 10, max_temp: 10, temp_spread: 0 },
        4 => { min_temp: -10, max_temp: -5, temp_spread: 5 },
        5 => { min_temp: -10, max_temp: 0, temp_spread: 10 },
      }
    end

    it 'returns the min spread temp' do
      min_spread_temp = described_class.new(weather).call
      expect(min_spread_temp).to eq(3)
    end
  end

  context 'when there is no weather information' do
    it 'returns nil' do
      min_spread_temp = described_class.new({}).call
      expect(min_spread_temp).to be_nil
    end
  end
end
