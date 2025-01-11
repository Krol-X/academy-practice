# frozen_string_literal: true

class Browser
  def initialize(router)
    @router = router
    @args = {}
  end

  def query(url, method = :get)
    @router.fetch(method, url, @args)
  end

  def repl
    loop do
      print('>')
      line = gets.chomp
      parts = line.split(' ')
      cmd = parts[0]
      resp = case cmd
             when 'exit', 'quit'
               break
             when 'get'
               query(parts[1])
             when 'post'
               query(parts[1], :post)
             when 'put'
               query(parts[1], :put)
             when 'delete'
               query(parts[1], :delete)
             # when 'set'
             #   parts.shift
             #   set(parts)
             else
               'Unknown command'
             end
      puts resp
    end
  end
end
