module Football
  class MinGoalsDifferenceCalculator
    def initialize(teams_info = nil)
      @teams_info = teams_info || FileParser.new.call
    end

    def call
      return unless @teams_info.present?

      min_goals_difference = @teams_info.min_by { |day| day.last[:goals_difference] }
      min_goals_difference.first
    end
  end
end
