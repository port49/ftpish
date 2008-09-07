class Uploads < Application

  def index
    render :action => 'index'
  end
  
  def post
    new_file_path = Merb.root / RAILS_PATH / 'public' / 'files' / params[:directory][:path] / sanitize_filename( params[:file][:filename] )
    FileUtils.mv params[:file][:tempfile].path, new_file_path
    redirect "#{ RAILS_URL }/directory?id=#{ params[:directory][:path] }"
  end

  def sanitize_filename( filename )
    filename.gsub(/\s+/, '_').downcase
  end
  
end
