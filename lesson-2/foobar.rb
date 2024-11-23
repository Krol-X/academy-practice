# frozen_string_literal: true

require_relative 'foobar_defs'

def foobar
  puts 'Введите первое число'
  first_number = gets.to_i
  puts 'Введите второе число'
  second_number = gets.to_i
  result = foobar_out(first_number, second_number)
  puts "Результат: #{result}"
end

foobar
