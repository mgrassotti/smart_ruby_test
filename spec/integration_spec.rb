# frozen_string_literal: true

require_relative '../parser'

RSpec.describe Parser, '#run' do
  it 'prints the results to stdout' do
    expect { Parser.run ['spec/dummy/example.log'] }.to(
      output('/help_page/1 2 visits /contact 1 visit /home 1 visit '\
        '/about/2 1 visit ' + "\n").to_stdout
    )
  end
end
