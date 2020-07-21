# frozen_string_literal: true

require_relative 'lib/log_parser'
require_relative 'lib/results_printer'

# Main application class
class Parser
  # An error is raised if
  # an input file argument is not provided
  class MissingArgumentError < StandardError
    def initialize
      super 'Argument not provided: \'./parse.rb <logfile_path>\' expected. '\
        'Please provide an input file path and retry.'
    end
  end

  def self.run(args = [])
    raise MissingArgumentError unless args.any?

    list = LogParser.new(args.first).read
    ResultsPrinter.new(list).run
  end
end
