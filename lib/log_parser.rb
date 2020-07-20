# frozen_string_literal: true

# Initialized with a log file path,
# #run returns:
# a list of webpages with most page views,
# ordered from most pages views to less page views
# a list of webpages with most unique page views also ordered
class LogParser
  attr_reader :filepath

  def initialize(path)
    @filepath = path
  end

  def print_path_not_found
    puts 'Input file not found at path ' + "'#{filepath}'"
    puts 'Please, check it and retry'
  end

  def run
    unless FileTest.exists?(filepath)
      print_path_not_found
      return
    end

    File.open(filepath).each do |line|
      puts line
    end
  end
end
