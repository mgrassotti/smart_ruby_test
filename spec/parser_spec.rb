# frozen_string_literal: true

require 'log_parser'

RSpec.describe LogParser, '#run' do
  context 'when the input file does not exist' do
    it 'prints the errors and returns' do
      parser = LogParser.new('/unexisting_file_path')
      expect { parser.run }.to raise_error(LogParser::FileNotFoundError)
    end
  end

  context 'when the input file exists' do
    context 'but it is not properly formatted' do
      it 'prints the error and returns' do
        parser = LogParser.new('./spec/dummy/not_properly_formatted.log')
        expect { parser.run }.to raise_error(LogParser::BadFileFormattingError)
      end
    end

    context 'and it is valid' do
      it 'parses the file' do
        parser = LogParser.new('./spec/dummy/example.log')
        parser.run
        expect(parser.list.length).to eq(4)
        expect(parser.list.keys).to eq(%w[/contact /help_page/1 /home /about/2])
      end
    end
  end
end
