# frozen_string_literal: true

require_relative 'visits_list'

# #run prints a list of webpages with most page views
# and a list of webpages with most unique page views.
# To be initialized with a websites parsed list (hash).
class ResultsPrinter
  attr_reader :list

  def initialize(visits_list)
    visits_list.is_a?(VisitsList) ||
      raise("Invalid argument: got #{visits_list.class}, expected VisitsList")
    @list = visits_list
  end

  def run
    print_results list.by_visits
    print_results list.by_unique_visits, unique: true
  end

  def print_results(results, unique: false)
    results.each do |page, visits|
      n = unique ? visits[:unique_visits] : visits[:visits]
      print "#{page} #{n} "\
            "#{'unique ' if unique}"\
            "#{n == 1 ? 'visit' : 'visits'} "
    end
    print "\n"
  end
end
