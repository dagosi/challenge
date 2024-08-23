module Weather
  class MinTempSpreadCalculator
    def initialize(weather_info = nil)
      @weather = weather_info || FileParser.new.call
    end

    def call
      return unless @weather.present?

      min_spread_info = @weather.min_by { |day| day.last[:temp_spread] }
      min_spread_info.first
    end
  end
end
