# frozen_string_literal: true

require_relative 'lib/log_parser'
require_relative 'lib/results_printer'

# Main application class
class Parser
  def self.run(args)
    list = LogParser.new(args.first).read
    ResultsPrinter.new(list).run
  end
end
