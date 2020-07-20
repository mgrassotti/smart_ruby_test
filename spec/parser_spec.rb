# frozen_string_literal: true

require 'log_parser'

RSpec.describe LogParser, '#run' do
  context 'when the input file does not exist' do
    it 'returns the errors and aborts execution' do
      parser = LogParser.new('/unexisting_file_path')
      expect { parser.run }.to output(parser.print_path_not_found).to_stdout
    end
  end
end
