#!/usr/bin/env ruby

require_relative 'lib/log_parser'

parsed_list = LogParser.new(ARGV.first).read
ListAnalyzer.new(parsed_list).run
