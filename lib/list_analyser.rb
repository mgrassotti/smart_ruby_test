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
    sort(list_by_visit).each do |page, visits|
      print "#{page} #{visits} #{visits == 1 ? 'visit' : 'visits'} "
    end
    print "\n"
    sort(list_by_unique_visits).each do |page, visits|
      print "#{page} #{visits} unique #{visits == 1 ? 'visit' : 'visits'} "
    end
    print "\n"
  end

  def sort(list)
    Hash[list.sort_by { |_, visits| -visits }]
  end

  def list_by_visit
    list.transform_values(&:count)
  end

  def list_by_unique_visits
    list.transform_values { |addresses| addresses.uniq.count }
  end
end
