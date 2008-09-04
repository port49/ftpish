class Uploads < Application

  def index
    render :action => 'index'
  end
  
  def post
    FileUtils.mv params[:file][:tempfile].path, Merb.root / 'public' / 'files' / params[:file][:filename]
    Merb.root / 'public' / 'files' / params[:file][:filename]
  end

  def sanitize_filename
    @filename = params[:filename].gsub(/\s+/, '_')
    @filename.downcase!
  end
  
end
