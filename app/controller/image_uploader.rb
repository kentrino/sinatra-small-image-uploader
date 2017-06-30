class ImageUploader < Application
  UPLOAD_PATH = "#{Application::ROOT}/upload/"

  post '/' do
    tempfile = params[:file][:tempfile]
    extension = File.extname(params[:file][:filename])
    filename = (Time.now.to_f * 1000).to_i.to_s + extension

    File.open("#{UPLOAD_PATH}/#{filename}", 'wb') do |f|
      f.write(tempfile.read)
    end
    ProcessQueue.add(filename)
  end

  get '/' do
    #slim :image_uploader
    @list = ProcessQueue.get()
    slim :image_uploader
  end
end
