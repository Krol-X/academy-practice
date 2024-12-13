# frozen_string_literal: true

require_relative 'bank_defs'

MENU = {
  'd': :deposit,
  'w': :withdraw,
  'b': :balance,
  'h': :help,
  '?': :help
}.freeze

def main # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
  save_account unless load_account

  puts 'Введите h или ? для справки'

  loop do
    cmd = gets[0].downcase.to_sym
    next if cmd == ''
    break if cmd == :q

    begin
      raise NoCommand unless MENU.key? cmd

      send(MENU[cmd])
    rescue UnknownCommand => e
      puts e.message
    rescue NumberLessZero => e
      puts e.message
    rescue NumberGreaterBalance => e
      puts e.message
    end
  end
end

main
