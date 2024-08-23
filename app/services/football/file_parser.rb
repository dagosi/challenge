module Football
  class FileParser
    def initialize(file_path = nil)
      @file_path = file_path || Rails.root.join('soccer.dat')
    end

    def call
      league_data = {}

      File.readlines(@file_path, chomp: true).each do |line|
        line = line.strip.split
        team_name = parse_team_name(line)
        next unless team_name

        goals_info = extract_goals_info(line)
        league_data[team_name] = goals_info if goals_info
      end

      league_data
    end

    private

    # NOTE: This solution depends on the file format given in the example.
    # It was not considered to give a dynamic approach.
    def extract_goals_info(line)
      goals_scored = line[6].to_i
      goals_against = line[8].to_i
      goals_difference = (goals_scored - goals_against).abs

      {
        goals_scored: goals_scored,
        goals_against: goals_against,
        goals_difference: goals_difference
      }
    end

    def parse_team_name(file_line)
      file_line[1] if position_num?(file_line[0]) && team_name?(file_line[1])
    end

    def team_name?(string)
      string =~ /\w+/
    end

    def position_num?(string)
      string =~ /\d+\./
    end
  end
end
