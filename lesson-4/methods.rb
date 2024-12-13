# frozen_string_literal: true

require_relative 'methods_def'

FILENAME = 'methods_test.txt'

def main # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
  create FILENAME, <<~END_
    test
    file
    ok
  END_
  puts 'CREATE'
  puts index FILENAME
  puts

  puts 'FIND'
  puts find FILENAME, 2
  puts

  puts 'DELETE'
  delete FILENAME, 2
  puts index FILENAME
  puts

  puts 'WHERE'
  puts where FILENAME, 'es'
  puts

  puts 'UPDATE'
  update FILENAME, 1, "ok?\n"
  puts index FILENAME

  File.delete FILENAME
end

main
