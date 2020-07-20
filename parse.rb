# frozen_string_literal: true

# !/usr/bin/env ruby
require_relative 'lib/log_parser'

LogParser.new(ARGV.first).run
