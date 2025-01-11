# frozen_string_literal: true

require_relative 'helpers/requests'
require_relative 'helpers/resources'

module Core
  class Router
    attr_reader :routes

    include Helpers::Requests
    include Helpers::Resources

    def initialize
      @routes = {
        get: {},
        post: {},
        put: {},
        delete: {}
      }
    end

    def fetch(method_name, url, params = {})
      return 'Page not found!' unless @routes[method_name].key? url

      @routes[method_name][url].call(
        {
          url: url,
          params: params,
          router: self
        }
      )
    end
  end
end
