# frozen_string_literal: true

require 'forwardable'
require 'set'

# Handles the counting and sorting
# operations on visits hashes
class VisitsList
  extend Forwardable
  attr_reader :hash

  def_delegators :hash, :keys, :sort_by

  def initialize
    @hash = {}
  end

  def add(page, address)
    hash[page] ||= { addresses: Set.new, visits: 0, unique_visits: 0 }
    hash[page][:visits] += 1
    hash[page][:unique_visits] += 1 if hash[page][:addresses].add?(address)
  end

  def length
    keys.length
  end

  def by_visits
    Hash[sort_by { |_, values| -values[:visits] }]
  end

  def by_unique_visits
    Hash[sort_by { |_, values| -values[:unique_visits] }]
  end
end
