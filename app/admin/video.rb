ActiveAdmin.register Video do
  member_action :create, :method => :put do
    @video = Video.new
    @video.upload(params[:video])
    render :text => "File has been uploaded successfully"
  end

  form do |f|
    f.inputs "Videos" do
      f.input :url, :as => :file
    end
    f.actions
  end
  
end
