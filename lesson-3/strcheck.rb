# frozen_string_literal: true

require_relative 'strcheck_defs'

print 'Введите строку: '
input = gets || ''
puts check input.chomp
