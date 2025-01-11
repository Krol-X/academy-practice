# frozen_string_literal: true

module App
  class Router < Core::Router
    def initialize
      super

      get '/', to: RootController.method(:greeting)
      get '/help', to: RootController.method(:help)
      get '/routes', to: RootController.method(:routes)
    end
  end
end
