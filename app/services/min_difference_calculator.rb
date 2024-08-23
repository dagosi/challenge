class MinDifferenceCalculator
  def initialize(key, parser, info = nil)
    @key = key
    @info = info || parser.new.call
  end

  def call
    return unless @info.present?

    min_difference = @info.min_by { |data| data.last[@key] }
    min_difference.first
  end
end
