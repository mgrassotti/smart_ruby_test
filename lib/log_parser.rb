# frozen_string_literal: true

# Initialized with a log file path,
# #run returns:
# a list of webpages with most page views,
# ordered from most pages views to less page views
# a list of webpages with most unique page views also ordered
class LogParser
  class FileNotFoundError < StandardError; end
  class BadFileFormattingError < StandardError; end
  attr_reader :filepath
  attr_accessor :list

  def initialize(path)
    @filepath = path
    @list = {}
  end

  def run
    unless FileTest.exists?(filepath)
      raise FileNotFoundError, "Input file not found at path '#{filepath}'. "\
        'Please, check it and retry'
    end

    read_file
    print_results
  end

  def read_file
    File.open(filepath).each_with_index do |row, i|
      key, value = row.split(' ')
      unless key && value
        raise BadFileFormattingError, "Input file '#{filepath}' is not properly "\
          "formatted at line ##{i}: 'Page ip_address' expected, got #{row}. "\
          'Please, check it and retry'
      end
      list[key] ||= 0
      list[key] += 1
    end
  end

  def order_list_by_visits
    @list = Hash[list.sort_by { |_, visits| -visits }]
  end

  def list_by_visits
    order_list_by_visits
  end

  def print_results
    list_by_visits.each do |page, visits|
      print "#{page} #{visits} #{visits == 1 ? 'visit' : 'visits'} "
    end
    print "\n"
  end
end
