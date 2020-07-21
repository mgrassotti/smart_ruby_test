#!/usr/bin/env ruby
# frozen_string_literal: true

require 'rubygems'

app_ruby_version = File.read('.ruby-version')

unless Gem::Version.new(RUBY_VERSION) >= Gem::Version.new(app_ruby_version)
  puts "Warning: the script was developed using ruby #{app_ruby_version}"
end

require_relative 'parser'

Parser.run(ARGV)
