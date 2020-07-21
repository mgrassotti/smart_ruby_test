# frozen_string_literal: true

require_relative 'visits_list'

# #run prints a list of webpages with most page views
# and a list of webpages with most unique page views.
# To be initialized with a websites parsed list (hash).
class ResultsPrinter
  PADDING = 23
  TITLE_SPACING = 2
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
    self.unique = unique
    puts framed_title
    results.each do |page, visits|
      printf "%<page>-20s %<visits>s\n", page: page, visits: unique ? visits[:unique_visits] : visits[:visits]
    end
    print "\n"
  end

  def calculate_paddings
    self.title = "#{'Unique ' if unique}Visits"
    (PADDING - title.length - TITLE_SPACING * 2).tap do |title_padding|
      self.remainder_p = title_padding % 2
      self.title_side_p = title_padding / 2
    end
  end

  def framed_title
    calculate_paddings
    <<~TITLE
      #{'#' * PADDING}
      #{'#' * title_side_p}\
      #{' ' * TITLE_SPACING}#{title}#{' ' * TITLE_SPACING}\
      #{'#' * title_side_p}#{'#' * remainder_p}
      #{'#' * PADDING}
    TITLE
  end

  private

  attr_accessor :unique, :title, :title_side_p, :remainder_p
end
