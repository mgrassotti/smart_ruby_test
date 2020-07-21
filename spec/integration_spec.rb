# frozen_string_literal: true

RSpec.describe Parser, '#run' do
  it 'prints the results to stdout' do
    expect { Parser.run ['spec/dummy/example.log'] }.to(
      output(File.read('./spec/dummy/example.output')).to_stdout
    )
  end
end
