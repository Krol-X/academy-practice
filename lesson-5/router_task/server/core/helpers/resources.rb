# frozen_string_literal: true

module Core
  module Helpers
    module Resources
      def resources(url, controller)
        @routes[:get].merge(
          {
            url => controller.method(:index),
            "#{url}/show" => controller.method(:show)
          }
        )
        @routes[:post].merge(
          { url => controller.method(:create) }
        )
        @routes[:put].merge(
          { url => controller.method(:update) }
        )
        @routes[:delete].merge(
          { url => controller.method(:destroy) }
        )
      end
    end
  end
end
