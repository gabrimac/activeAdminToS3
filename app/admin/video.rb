ActiveAdmin.register Video do
  member_action :create, :method => :put do
    @video = Video.new
    @video.upload(params[:video])
    flash.now[:notice] = "File has been uploaded successfully"
    render :action => 'index'
  end

  form do |f|
    f.inputs "Videos" do
      f.input :url, :as => :file
    end
    f.actions
  end
  
end
