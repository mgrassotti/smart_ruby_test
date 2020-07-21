# frozen_string_literal: true

class LogParser
  # A good input file requires the formatting
  # Page1 ip_address1
  # Page2 ip_address2
  class BadFileFormattingError < StandardError
    def initialize(filepath, line_number, full_line)
      super "Input file '#{filepath}' is not properly "\
        "formatted at line ##{line_number}: "\
        "'Page ip_address' expected, got #{full_line}. "\
        'Please, check it and retry'
    end
  end
  # An error is raised if
  # a file is not found at the provided path
  class FileNotFoundError < StandardError
    def initialize(path)
      super "Input file not found at path '#{path}'. "\
        'Please, check it and retry'
    end
  end

  # An error is raised if
  # an input file argument is not provided
  class MissingArgumentError < StandardError
    def message
      'Argument not provided: \'./parse.rb <logfile_path>\' expected. Please provide an input file path and retry.'
    end
  end
end
