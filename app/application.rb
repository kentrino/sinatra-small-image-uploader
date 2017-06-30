require 'bundler'
Bundler.require

class Application < Sinatra::Base
  # helpers ApplicationHelper
  ROOT = File.join(File.expand_path(__dir__), '../')

  set :views, File.expand_path('../view', __FILE__)

  configure :development do
    Bundler.require :development
    register Sinatra::Reloader
  end

  not_found do
    slim :e404
  end

  error do
    slim :e404
  end
end

require 'yaml'
require "active_support/core_ext/hash/indifferent_access"
redis_config_all = HashWithIndifferentAccess.new(
    YAML.load(File.open(File.join(Application::ROOT, 'config/redis.yml'))))
# change with environment
Application::REDIS_CONFIG = redis_config_all[:default].merge(redis_config_all[:development])
