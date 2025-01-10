# frozen_string_literal: true

module App
  class Router < Core::Router
    def initialize
      super

      get '/', to: HomeController.method(:hello)
    end
  end
end
