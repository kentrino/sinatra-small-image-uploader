class ImageUploader < Application
  UPLOAD_PATH = "#{APP_ROOT}/upload/"

  post '/' do
    tempfile = params[:file][:tempfile] 
    filename = Time.now.to_i.to_s

    File.open("#{UPLOAD_PATH}/#{filename}", 'wb') do |f|
      f.write(tempfile.read)
    end
    'SUCCESS'
  end

  get '/' do
    slim :image_uploader
  end
end
