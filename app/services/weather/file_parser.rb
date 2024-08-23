module Weather
  class FileParser
    def initialize(file_path = nil)
      @file_path = file_path || Rails.root.join('w_data.dat')
    end

    def call
      day_data = {}

      File.readlines(@file_path, chomp: true).each do |line|
        line = line.strip.split
        day_num = parse_day_number(line)
        next unless day_num

        temps_info = extract_temp_info(line)
        day_data[day_num] = temps_info if temps_info
      end

      day_data
    end

    private

    # NOTE: This solution depends on the file format given in the example.
    # It was not considered to give a dynamic approach.
    def extract_temp_info(line)
      max_temp = line[1].to_i
      min_temp = line[2].to_i
      temp_spread = (max_temp - min_temp).abs

      { min_temp: min_temp, max_temp: max_temp, temp_spread: temp_spread }
    end

    def parse_day_number(file_line)
      Integer(file_line[0])
    rescue TypeError, ArgumentError
      nil
    end
  end
end
