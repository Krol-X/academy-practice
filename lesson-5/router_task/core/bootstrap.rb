# frozen_string_literal: true

module App
  # Инициализация путей
  ROOT_PATH = File.expand_path('../', __dir__)
  DB_PATH = File.join(ROOT_PATH, 'temp', 'db.json')
  CONTROLLERS_PATH = File.join(ROOT_PATH, 'app', 'controllers')
  MODELS_PATH = File.join(ROOT_PATH, 'app', 'models')
end

# Загрузка класса маршрутизатора
require_relative 'router'

# Загрузка контроллеров приложения
Dir.each_child(App::CONTROLLERS_PATH) do |file|
  require File.join(App::CONTROLLERS_PATH, file)
end

# Загрузка маршрутов приложения
require File.join(App::ROOT_PATH, 'app', 'router.rb')

# Классы в памяти после загрузки:
# App
#   ...controllers
#   ...
#   Router
# Core
#   Helpers
#     Requests
#     Resources
#   Router
