# frozen_string_literal: true

RSpec.describe Parser, '#run' do
  it 'prints the results to stdout' do
    expect { Parser.run ['spec/dummy/example.log'] }.to(
      output('/help_page/1 2 visits /contact 1 visit /home 1 visit '\
        '/about/2 1 visit ' + "\n" + '/help_page/1 2 unique visits '\
        '/contact 1 unique visit /home 1 unique visit '\
        '/about/2 1 unique visit ' + "\n").to_stdout
    )
  end
end
