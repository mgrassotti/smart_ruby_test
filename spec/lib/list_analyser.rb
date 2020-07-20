# frozen_string_literal: true

require 'log_parser'
require 'list_analyser'

RSpec.describe ListAnalyser, '#run' do
  it 'ranks the pages list by visits' do
    list = LogParser.new('./spec/dummy/example.log').read
    expect { ListAnalyser.new(list).run }.to output('/help_page/1 2 visits /contact 1 visit '\
      '/home 1 visit /about/2 1 visit ' + "\n").to_stdout
  end
end
