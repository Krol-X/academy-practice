# frozen_string_literal: true

def greeting_out(name, surname, age)
  if age < 18
    "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
  else
    "Привет, #{name} #{surname}. Самое время заняться делом!"
  end
end
