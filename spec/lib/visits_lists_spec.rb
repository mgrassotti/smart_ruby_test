# frozen_string_literal: true

require 'log_parser'
require 'visits_list'

RSpec.describe VisitsList do
  let(:list) do
    LogParser.new('./spec/dummy/example_unique_visits.log').read
  end

  let(:list_by_visits) { list.by_visits }
  let(:list_by_unique_visits) { list.by_unique_visits }

  it 'counts visits' do
    expect(list_by_visits['/help_page/1'][:visits]).to eq(3)
    expect(list_by_visits['/contact'][:visits]).to eq(2)
    expect(list_by_visits['/home'][:visits]).to eq(1)
    expect(list_by_visits['/about/2'][:visits]).to eq(1)
  end

  it 'counts unique visits' do
    expect(list.by_unique_visits['/help_page/1'][:unique_visits]).to eq(2)
    expect(list.by_unique_visits['/contact'][:unique_visits]).to eq(1)
    expect(list.by_unique_visits['/home'][:unique_visits]).to eq(1)
    expect(list.by_unique_visits['/about/2'][:unique_visits]).to eq(1)
  end

  it 'sorts lists' do
    expect(list_by_visits.first[0]).to eq('/help_page/1')
    expect(list_by_visits.first[1][:visits]).to eq(3)
    expect(list_by_unique_visits.first[0]).to eq('/help_page/1')
    expect(list_by_unique_visits.first[1][:unique_visits]).to eq(2)
  end
end
