class ImageUploader < Application
  post '/' do
    tempfile = params[:file][:tempfile]
    default_filename = params[:file][:filename]

    file_store = FileStore.new 
    file_store.save(tempfile, default_filename)
    FileProcessQueue.add(file_store.filename)
    redirect '/image_uploader/', 303
  end

  get '/' do
    @list = FileProcessQueue.get()
    slim :image_uploader
  end
end
