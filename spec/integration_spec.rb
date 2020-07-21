# frozen_string_literal: true

RSpec.describe Parser, '#run' do
  context 'when the argument is not provided' do
    it 'raises an error' do
      expect { Parser.run [] }.to(
        raise_error(Parser::MissingArgumentError)
      )
    end
  end
  context 'when the input file does not exist' do
    it 'raises an error on initialization' do
      expect { Parser.run ['/unexisting_file_path'] }.to(
        raise_error(LogParser::FileNotFoundError)
      )
    end
  end
  context 'when the input file does exist' do
    it 'prints the results to stdout' do
      expect { Parser.run ['spec/dummy/example.log'] }.to(
        output(File.read('./spec/dummy/example.output')).to_stdout
      )
    end
  end
end
