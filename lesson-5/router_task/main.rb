# frozen_string_literal: true

require_relative 'server/bootstrap'
require_relative 'client/browser'

router = App::Router.new
browser = Browser.new(router)
puts browser.query '/'
browser.repl
