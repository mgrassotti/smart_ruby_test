# frozen_string_literal: true

RSpec.describe ResultsPrinter, '#run' do
  it 'ranks the pages list by visits' do
    list = LogParser.new('./spec/dummy/example.log').read
    expect { ResultsPrinter.new(list).run }.to output(
      File.read('./spec/dummy/example.output')
    ).to_stdout
  end

  it 'ranks the pages list by unique visits' do
    list = LogParser.new('./spec/dummy/example_unique_visits.log').read
    expect { ResultsPrinter.new(list).run }.to output(
      File.read('./spec/dummy/example_unique_visits.output')
    ).to_stdout
  end
end
