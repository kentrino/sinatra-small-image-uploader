class ImageUploader < Application

  post '/' do
    tempfile = params[:file][:tempfile]
    filename = params[:file][:filename]
    UploadFileHander.save(tempfile, filename)
    FileProcessQueue.add(filename)
    redirect '/image_uploader/', 303
  end

  get '/' do
    #slim :image_uploader
    @list = FileProcessQueue.get()
    slim :image_uploader
  end
end
