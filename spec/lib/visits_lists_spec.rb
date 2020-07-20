# frozen_string_literal: true

require 'log_parser'
require 'visits_list'

RSpec.describe VisitsList do
  let(:visits_hash) do
    LogParser.new('./spec/dummy/example_unique_visits.log').read
  end
  let(:list) { VisitsList.new(visits_hash) }

  it 'counts visits' do
    expect(list.by_visits.hash).to eq(
      { '/help_page/1' => 3, '/contact' => 2, '/home' => 1, '/about/2' => 1 }
    )
  end

  it 'counts unique visits' do
    expect(list.by_unique_visits.hash).to eq(
      { '/help_page/1' => 2, '/contact' => 1, '/home' => 1, '/about/2' => 1 }
    )
  end

  it 'sorts lists' do
    expect(list.by_visits.sort).to eq(
      { '/help_page/1' => 3, '/contact' => 2, '/home' => 1, '/about/2' => 1 }
    )
    expect(list.by_unique_visits.sort).to eq(
      { '/help_page/1' => 2, '/contact' => 1, '/home' => 1, '/about/2' => 1 }
    )
  end
end
