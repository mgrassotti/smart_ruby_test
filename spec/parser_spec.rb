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
        %w[/contact /help_page/1 /home /about/2].each do |page|
          expect(parser.list.keys).to include(page)
        end
      end
    end
  end

  context 'with a valid input' do
    it 'ranks the pages list by visits' do
      parser = LogParser.new('./spec/dummy/example.log')
      expect { parser.run }.to output('/help_page/1 2 visits /contact 1 visit '\
        '/home 1 visit /about/2 1 visit ' + "\n").to_stdout
    end
  end
end
