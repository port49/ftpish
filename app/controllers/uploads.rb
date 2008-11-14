class Uploads < Application

  def index
    render :action => 'index'
  end
  
  def post
    params[:file].each_value do |file| # file won't have symbolized keys
      if file['filename'] && file['filename'].length > 0
        new_file_path = Merb.root / RAILS_PATH / 'public' / 'files' / params[:directory][:path] / sanitize_filename( file['filename'] )
        FileUtils.mv file['tempfile'].path, new_file_path
        File.chmod( 0664, new_file_path )
      end
    end
    redirect "#{ request.protocol }#{ request.host }/directory?id=#{ params[:directory][:path] }"
  end

  def sanitize_filename( filename )
    filename.gsub(/\s+/, '_').downcase
  end
  
end
