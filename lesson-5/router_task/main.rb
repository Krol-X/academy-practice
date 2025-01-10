# frozen_string_literal: true

require_relative 'core/bootstrap'

# Router test
router = App::Router.new
puts router.query :get, '/'
