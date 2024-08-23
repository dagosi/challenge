require 'rails_helper'

describe Football::MinGoalsDifferenceCalculator do
  context 'when there is goals information' do
    let(:goals_info) do
      {
        "Arsenal" => { goals_scored: 10, goals_against: 1, goals_difference: 9 },
        "Leeds" => { goals_scored: 3, goals_against: 15, goals_difference: 12 },
        "Aston_Villa" => { goals_scored: 20, goals_against: 0, goals_difference: 20 },
        "Bolton" => { goals_scored: 0, goals_against: 0, goals_difference: 0 },
        "Leicester" => { goals_scored: 5, goals_against: 10, goals_difference: 5 },
      }
    end

    it 'returns the min goal difference team' do
      min_goals_difference = described_class.new(goals_info).call
      expect(min_goals_difference).to eq("Bolton")
    end
  end

  context 'when there is no goals information' do
    it 'returns nil' do
      min_goals_difference = described_class.new({}).call
      expect(min_goals_difference).to be_nil
    end
  end
end
