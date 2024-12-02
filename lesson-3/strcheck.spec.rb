# frozen_string_literal: true

require 'rspec'
require_relative 'strcheck_defs'

describe 'strcheck' do
  it 'должно возвращать 2 в степени длины строки, если строка заканчивается на "CS" в любом регистре символов' do
    expect(
      check('asdasdCS')
    ).to eq 256
  end

  it 'должно возвращать строку задом-наперёд, если он не оканчивается на "CS" в любом регистре символов' do
    expect(
      check('asdasd')
    ).to eq 'dsadsa'
  end
end
