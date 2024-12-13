# frozen_string_literal: true

require_relative 'filter_defs'

def main
  data = read_data 'lesson-4\source.txt'

  loop do
    print 'Введите нужный возраст или -1: '
    age = gets.to_i
    return if age == -1

    save 'lesson-4\result.txt', data, age
  end
end

main
