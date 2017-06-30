class ImageUploader < Application

  post '/' do
    tempfile = params[:file][:tempfile]
    default_filename = params[:file][:filename]
    filename = UploadFileHander.save(tempfile, default_filename)
    FileProcessQueue.add(filename)
    redirect '/image_uploader/', 303
  end

  get '/' do
    #slim :image_uploader
    @list = FileProcessQueue.get()
    slim :image_uploader
  end
end
