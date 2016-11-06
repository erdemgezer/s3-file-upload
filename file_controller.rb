class FileController < ApplicationController
  def presigned_s3_url
    s3 = Aws::S3::Resource.new
    obj = s3.bucket("moryaka").object("#{SecureRandom.uuid}/#{params[:file_name]}")
    url = URI.parse(obj.presigned_url(:put)).to_s
    render json: { value: url }
  end
end
