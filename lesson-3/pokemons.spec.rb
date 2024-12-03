# frozen_string_literal: true

require 'rspec'
require 'stringio'

require_relative 'pokemons_defs'

describe 'pokemons' do
  it 'format преобразует массив покемонов в json-подобную строку' do
    expect(
      format(
        [
          { name: 'Пикачу', color: 'Жёлтый' },
          { name: 'Видл', color: 'Зелёный' }
        ]
      )
    ).to eq('[{ name: \'Пикачу\', color: \'Жёлтый\' }, { name: \'Видл\', color: \'Зелёный\' }]')
  end

  # TODO: проверка ввода-вывода
end
