require 'sinatra'
require 'sinatra/reloader' if development?
require 'slim'

get '/' do
  slim :index
end

not_found do
  status 404
  slim :e404
end
