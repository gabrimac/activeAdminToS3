class Video < ActiveRecord::Base
  #attr_accessible :url
  def upload(video)
    name = video[:url].original_filename
    key = File.basename(name)
    s3 = AWS::S3.new(:access_key_id => ENV["AWS_ACCESS_KEY_ID"], :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"])
    s3.buckets[ENV["AWS_S3_BUCKET"]].objects[key].write(:file => video[:url].tempfile.path)
    uri = s3.buckets[ENV["AWS_S3_BUCKET"]].objects[key].url_for(:read)
    self.url = "http://"+uri.host+uri.request_uri
    self.save
  end
end
