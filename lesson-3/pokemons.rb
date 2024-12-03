# frozen_string_literal: true

require_relative 'pokemons_defs'

n = read_how_pokemons?
pokemons = get_pokemons n
puts format pokemons
