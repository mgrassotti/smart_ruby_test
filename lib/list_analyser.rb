# frozen_string_literal: true

# To be initialized with a websites parsed list (hash),
# #run returns:
# a list of webpages with most page views,
# ordered from most pages views to less page views
# a list of webpages with most unique page views also ordered
class ListAnalyser
  attr_reader :list

  def initialize(list)
    @list = list
  end

  def run
    list_by_visits.each do |page, visits|
      print "#{page} #{visits} #{visits == 1 ? 'visit' : 'visits'} "
    end
    print "\n"
  end

  def list_by_visits
    Hash[list.sort_by { |_, visits| -visits }]
  end
end
