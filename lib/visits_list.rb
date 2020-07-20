# frozen_string_literal: true

# Handles the counting and sorting
# operations on visits hashes
class VisitsList
  attr_reader :hash

  def initialize(hash)
    @hash = hash
  end

  def sort
    Hash[hash.sort_by { |_, visits| -visits }]
  end

  def by_visits
    VisitsList.new(hash.transform_values(&:count))
  end

  def by_unique_visits
    VisitsList.new(hash.transform_values { |addresses| addresses.uniq.count })
  end
end
