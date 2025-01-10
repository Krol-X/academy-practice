# frozen_string_literal: true

module Core
  module Helpers
    module Requests
      def get(url, to:)
        @routes[:get].merge!({ url => to })
      end

      def post(url, to:)
        @routes[:post].merge!({ url => to })
      end

      def put(url, to:)
        @routes[:put].merge!({ url => to })
      end

      def delete(url, to:)
        @routes[:delete].merge!({ url => to })
      end
    end
  end
end
