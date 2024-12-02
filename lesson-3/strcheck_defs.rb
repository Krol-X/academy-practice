# frozen_string_literal: true

def check(str)
  str.upcase.end_with?('CS') ? 2**str.length : str.reverse
end
