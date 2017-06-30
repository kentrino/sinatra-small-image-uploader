require 'pry'

class FileStore
  UPLOAD_PATH = "#{Application::ROOT}/upload/"

  attr_reader :filename, :filepath
  def save(file, default_filename)
    extension = File.extname(default_filename)
    @filename = (Time.now.to_f * 1000).to_i.to_s + extension
    @filepath = "#{UPLOAD_PATH}/#{@filename}"
    File.open(@filepath, 'wb') do |f|
      f.write(file.read)
    end
  end
end
