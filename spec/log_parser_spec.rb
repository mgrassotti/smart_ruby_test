# frozen_string_literal: true

require 'log_parser'

RSpec.describe LogParser do
  context 'when the input file does not exist' do
    it 'raise an error on initialization' do
      expect { LogParser.new('/unexisting_file_path') }.to(
        raise_error(LogParser::FileNotFoundError)
      )
    end
  end
end

RSpec.describe LogParser, '#read' do
  context 'when the input file exists' do
    context 'but it is not properly formatted' do
      it 'prints the error and returns' do
        parser = LogParser.new('./spec/dummy/not_properly_formatted.log')
        expect { parser.read }.to raise_error(LogParser::BadFileFormattingError)
      end
    end

    context 'and it is valid' do
      it 'parses the file' do
        parser = LogParser.new('./spec/dummy/example.log')
        parser.read
        expect(parser.list.length).to eq(4)
        %w[/contact /help_page/1 /home /about/2].each do |page|
          expect(parser.list.keys).to include(page)
        end
      end
    end
  end
end
