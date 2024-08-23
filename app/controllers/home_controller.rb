class HomeController < ApplicationController
  def index
    # @min_temp_spread = Weather::MinTempSpreadCalculator.new.call
    # @min_goal_difference_team = Football::MinGoalsDifferenceCalculator.new.call
    @min_temp_spread = MinDifferenceCalculator.new(:temp_spread, Weather::FileParser).call
    @min_goal_difference_team = MinDifferenceCalculator.new(:goals_difference, Football::FileParser).call
  end
end
