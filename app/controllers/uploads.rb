class Uploads < Application

  def index
    render :action => 'index'
  end
  
  def post
    new_file_path = Merb.root / '..' / '..' / 'rails' / 'lwdg_rails' / 'public' / 'files' / params[:directory][:path] / sanitize_filename( params[:file][:filename] )
    FileUtils.mv params[:file][:tempfile].path, new_file_path
    redirect "http://localhost:3000/directory?id=#{ params[:directory][:path] }"
  end

  def sanitize_filename( filename )
    filename.gsub(/\s+/, '_').downcase
  end
  
end
