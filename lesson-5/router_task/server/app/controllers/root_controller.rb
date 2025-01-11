# frozen_string_literal: true

module App
  class RootController
    def self.greeting(_request)
      'Введите "get /help" для справки. Доступные маршруты: "get /routes"'
    end

    def self.help(_request)
      <<~END_
        Программа представляет собой примитивную эмуляцию http-сервера.
        После получения ответа вы можете ввести команду:
        <команда> аргументы...
        get/post/put/delete <path> - отправить запрос серверу по пути path
        set <var> <value> - задать значение для отправки
        set - список заданных значений
        unset <var> - убрать значение
        unset - убрать все значения
        exit или quit - выйти из программы
      END_
    end

    def self.routes(request)
      response = "Доступные маршруты:\n"

      all_routes = request[:router].routes
      # {method: [{url: func},...]} -> {url: method}
      prepared_routes = {}

      all_routes.each_key do |method|
        all_routes[method].each do |hash|
          prepared_routes[hash[0]] = method
        end
      end

      prepared_routes.sort.each do |hash|
        route, method = hash
        response += "#{method.to_s.ljust(7)} #{route}\n"
      end

      response
    end
  end
end
