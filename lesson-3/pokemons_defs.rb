# frozen_string_literal: true

def read_how_pokemons?
  print 'Сколько всего покемонов? '
  s = gets
  s.to_i
end

def get_pokemons(n)
  pokemons = []
  (1..n).each do |i|
    new_pok = {}
    print "Имя покемона #{i}: "
    new_pok[:name] = gets.chomp
    print "Цвет покемона #{i}: "
    new_pok[:color] = gets.chomp
    pokemons << new_pok
  end
  pokemons
end

def format(pokemons)
  # result = '['
  # pokemons.each_index do |i|
  #   pok_item = pokemons[i]
  #   result << "{ name: '#{pok_item[:name]}', color: '#{pok_item[:color]}' }"
  #   result << ', ' if i != pokemons.length - 1
  # end
  # result << ']'
  "[#{pokemons.map { |it| "{ name: '#{it[:name]}', color: '#{it[:color]}' }" }.join ', '}]"
end
