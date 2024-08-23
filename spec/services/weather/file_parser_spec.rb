require 'rails_helper'

describe Weather::FileParser do
  context 'when reading the file example' do
    subject { described_class.new }

    it 'returns 30 days of weather' do
      weather = subject.call
      expect(weather.count).to eq(30)
    end

    it 'returns a hash with day numbers as keys from 1 to 30' do
      weather = subject.call
      expect(weather.keys).to match((1..30).to_a)
    end

    it 'returns a list of numeric temps' do
      weather = subject.call
      expect(weather).to include(
        {
          be_a(Integer) => {
            min_temp: be_a(Integer),
            max_temp: be_a(Integer),
            temp_spread: be_a(Integer)
          }
        }
      )
    end

    it 'returns the max temp, min temp, and temp spread of each day' do
      weather = subject.call
      expect(weather).to include(
        { 9 => { min_temp: 32, max_temp: 86, temp_spread: 54 } }
      )
    end
  end
end
