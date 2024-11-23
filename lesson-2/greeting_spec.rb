# frozen_string_literal: true

require 'rspec'
require_relative 'greeting_defs'

describe greeting_out do
  it 'должен возвращать строку с подбадриванием для людей младше 18 лет' do
    expect(
      greeting_out('Женя', 'Матросов', 16)
    ).to eq 'Привет, Женя Матросов. Тебе меньше 18 лет, но начать учиться программировать никогда не рано'
  end

  it 'должен возвращать строку с напоминанием о работе человеку старше 18 лет' do
    expect(
      greeting_out('Ваня', 'Булкин', 30)
    ).to eq 'Привет, Ваня Булкин. Самое время заняться делом!'
  end
end
