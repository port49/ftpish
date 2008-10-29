class Uploads < Application

  def index
    render :action => 'index'
  end
  
  def post
    if params[:file].is_a?( Array )
      params[:file].each |file|
        new_file_path = Merb.root / RAILS_PATH / 'public' / 'files' / params[:directory][:path] / sanitize_filename( file[:filename] )
        FileUtils.mv file[:tempfile].path, new_file_path
        File.chmod( 0664, new_file_path )
      end
    else
      new_file_path = Merb.root / RAILS_PATH / 'public' / 'files' / params[:directory][:path] / sanitize_filename( params[:file][:filename] )
      FileUtils.mv params[:file][:tempfile].path, new_file_path
      File.chmod( 0664, new_file_path )
    end
    redirect "#{ RAILS_URL }/directory?id=#{ params[:directory][:path] }"
  end

  def sanitize_filename( filename )
    filename.gsub(/\s+/, '_').downcase
  end
  
end
