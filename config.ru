require 'sinatra/base'

require './app/application.rb'
Dir.glob('./app/{controller}/*.rb').each do |file|
  require file
end

APP_ROOT = File.expand_path(__dir__)

map('/image_upload') do
  run ImageUploader
end
