# frozen_string_literal: true

require_relative 'lib/log_parser'
require_relative 'lib/list_analyser'

# Main application class
class Parser
  def self.run(args)
    list = LogParser.new(args.first).read
    ListAnalyser.new(list).run
  end
end
