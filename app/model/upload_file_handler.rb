class UploadFileHander
  UPLOAD_PATH = "#{Application::ROOT}/upload/"
  class << self
    def save(file, default_filename)
      extension = File.extname(default_filename)
      filename = (Time.now.to_f * 1000).to_i.to_s + extension
      path = "#{UPLOAD_PATH}/#{filename}"
      File.open(path, 'wb') do |f|
        f.write(file.read)
      end
    end
  end
end