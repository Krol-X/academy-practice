# frozen_string_literal: true

class CashMachine # rubocop:disable Style/Documentation
  # Константы и состояние объекта

  FILENAME = 'lesson-5/account.txt'
  START_BALANCE = 100.0

  MENU = {
    'd': :deposit,
    'w': :withdraw,
    'b': :balance,
    'h': :help,
    '?': :help
  }.freeze

  # Исключения класса

  class UnknownCommand < StandardError # rubocop:disable Style/Documentation
  end

  class NumberLessZero < StandardError # rubocop:disable Style/Documentation
  end

  class NumberGreaterBalance < StandardError # rubocop:disable Style/Documentation
  end

  # Основные методы класса

  def initialize
    @balance = START_BALANCE
  end

  def init
    save_account unless load_account
  end

  def main # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    puts 'Введите h или ? для справки'

    loop do
      cmd = gets[0].downcase.to_sym
      next if cmd == ''
      break if cmd == :q

      begin
        raise NoCommand unless MENU.key? cmd

        send(MENU[cmd])
      rescue UnknownCommand => e
        puts 'Такой команды не существует! Для справки напишите h или ?'
      rescue NumberLessZero => e
        puts 'Введённое число меньше нуля!'
      rescue NumberGreaterBalance => e
        puts 'Введённое число больше значения на балансе!'
      end
    end
  end

  # Функциональные методы класса

  def load_account
    return false unless File.exist? FILENAME

    File.open(FILENAME) { |file| @balance = file.readline.to_i }
    true
  end

  def save_account
    File.open(FILENAME, 'w') { |file| file.write(@balance) }
  end

  def deposit
    print 'Сколько денег положить на счёт? '
    n = gets.to_i

    raise NumberLessZero unless n.positive?

    @balance += n
    save_account
    puts 'Успешно!'
  end

  def withdraw
    print 'Сколько денег снять со счёта? '
    n = gets.to_i

    raise NumberLessZero unless n.positive?
    raise NumberGreaterBalance if n > @balance

    @balance -= n
    save_account
    puts 'Успешно!'
  end

  def balance
    puts "На счету: #{@balance}"
  end

  def help
    puts <<~END_
      Доступные команды:
      d - депозит (положить деньги на счёт)
      w - вывод денег со счёта
      b - информация о текущем балансе
      h или ? - этот текст
    END_
  end
end

bank = CashMachine.new
bank.init
bank.main
