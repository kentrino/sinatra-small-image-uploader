require 'sinatra/base'

require './app/application.rb'
Dir.glob(['./app/controller/*.rb', './app/model/*.rb', './lib/*.rb']).each do |file|
  require file
end

map('/image_upload') do
  run ImageUploader
end
