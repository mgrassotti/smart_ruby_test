# frozen_string_literal: true

require 'log_parser'
require 'list_analyser'

RSpec.describe ListAnalyser, '#run' do
  it 'ranks the pages list by visits' do
    list = LogParser.new('./spec/dummy/example.log').read
    expect { ListAnalyser.new(list).run }.to output(
      '/help_page/1 2 visits /contact 1 visit /home 1 visit /about/2 1 visit ' + "\n"\
      '/help_page/1 2 unique visits /contact 1 unique visit /home 1 unique visit /about/2 1 unique visit ' + "\n"
    ).to_stdout
  end

  it 'ranks the pages list by unique visits' do
    list = LogParser.new('./spec/dummy/example_unique_visits.log').read
    expect { ListAnalyser.new(list).run }.to output(
      '/help_page/1 3 visits /contact 2 visits /home 1 visit /about/2 1 visit ' + "\n"\
      '/help_page/1 2 unique visits /contact 1 unique visit /home 1 unique visit /about/2 1 unique visit ' + "\n"
    ).to_stdout
  end
end
