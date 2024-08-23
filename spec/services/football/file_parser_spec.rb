require 'rails_helper'

describe Football::FileParser do
  context 'when reading the file example' do
    subject { described_class.new }

    it 'returns 20 teams info' do
      positions_table = subject.call
      expect(positions_table.count).to eq(20)
    end

    it 'returns a hash with team names as keys' do
      weather = subject.call
      expect(weather.keys).to include('Arsenal', 'Chelsea', 'Everton', 'Bolton')
    end

    it 'returns a list of goals info by team' do
      weather = subject.call
      expect(weather).to include(
        {
          be_a(String) => {
            goals_scored: be_a(Integer),
            goals_against: be_a(Integer),
            goals_difference: be_a(Integer)
          }
        }
      )
    end
  end

  it 'returns the goals info of each team' do
    weather = subject.call
    expect(weather).to include(
      {
        'West_Ham' => {
          goals_scored: 48,
          goals_against: 57,
          goals_difference: 9
        }
      }
    )
  end
end
