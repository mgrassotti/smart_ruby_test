# frozen_string_literal: true

require_relative 'visits_list'

# #run prints a list of webpages with most page views
# and a list of webpages with most unique page views.
# To be initialized with a websites parsed list (hash).
class ListAnalyser
  attr_reader :list

  def initialize(list_hash)
    @list = VisitsList.new list_hash
  end

  def run
    print_results list.by_visits.sort
    print_results list.by_unique_visits.sort, unique: true
  end

  def print_results(results, unique: false)
    results.each do |page, visits|
      print "#{page} #{visits} #{'unique ' if unique}"\
        "#{visits == 1 ? 'visit' : 'visits'} "
    end
    print "\n"
  end
end
