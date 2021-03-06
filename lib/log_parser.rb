# frozen_string_literal: true

require_relative 'log_parser/errors'

# Initialized with a log file path,
# #read returns a list of webpages with associated views,
# ordered from most pages views to less page views
# a list of webpages with most unique page views also ordered
class LogParser
  attr_reader :filepath, :list

  def initialize(path)
    raise FileNotFoundError, path unless FileTest.exists?(path)

    @filepath = path
    @list = VisitsList.new
  end

  def read
    File.open(filepath).each_with_index do |line, i|
      page, address = line.split(' ')
      raise BadFileFormattingError.new(filepath, i, line) unless page && address

      list.add page, address
    end
    list
  end
end
