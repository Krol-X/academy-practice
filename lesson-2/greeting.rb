# frozen_string_literal: true

require_relative 'greeting_defs'

def greeting
  puts 'Введите имя'
  name = gets.chomp
  puts 'Введите фамилию'
  surname = gets.chomp
  puts 'Введите возраст'
  age = gets.to_i
  puts greeting_out(name, surname, age)
end

greeting
