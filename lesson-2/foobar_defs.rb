# frozen_string_literal: true

def foobar_out(first, second)
  if first == 20
    second
  elsif second == 20
    first
  else
    first + second
  end
end
