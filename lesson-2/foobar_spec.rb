# frozen_string_literal: true

require 'rspec'
require_relative 'foobar_defs'

describe 'foobar' do
  it 'должен возвращать второе число, если первое равно 20' do
    expect(foobar_out(20, 30)).to eq 30
  end

  it 'должен возвращать сумму чисел, если первое не равно 20' do
    expect(foobar_out(10, 30)).to eq 40
  end
end
