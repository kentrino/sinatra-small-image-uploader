require 'bundler'
Bundler.require
# require 'sinatra/reloader' if development?

class Application < Sinatra::Base
  # helpers ApplicationHelper
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
