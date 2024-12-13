# frozen_string_literal: true

FILENAME = 'lesson-4/account.txt'
START_BALANCE = 100.0

$balance = 0

class UnknownCommand < StandardError # rubocop:disable Style/Documentation
  def message
    'Такой команды не существует! Для справки напишите h или ?'
  end
end

class NumberLessZero < StandardError # rubocop:disable Style/Documentation
  def message
    'Введённое число меньше нуля!'
  end
end

class NumberGreaterBalance < StandardError # rubocop:disable Style/Documentation
  def message
    'Введённое число больше значения на балансе!'
  end
end

def load_account
  $balance = START_BALANCE
  return false unless File.exist? FILENAME

  File.open(FILENAME) { |file| $balance = file.readline.to_i }
  true
end

def save_account
  File.open(FILENAME, 'w') { |file| file.write($balance) }
end

def deposit
  print 'Сколько денег положить на счёт? '
  n = gets.to_i

  raise NumberLessZero unless n.positive?

  $balance += n
  save_account
  puts 'Успешно!'
end

def withdraw
  print 'Сколько денег снять со счёта? '
  n = gets.to_i

  raise NumberLessZero unless n.positive?
  raise NumberGreaterBalance if n > $balance

  $balance -= n
  save_account
  puts 'Успешно!'
end

def balance
  puts "На счету: #{$balance}"
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
