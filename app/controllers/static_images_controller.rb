class StaticImagesController < ApplicationController
  respond_to :json

  def create
    image = StaticImage.new
    if params[:post_id]
      image.post_id = params[:post_id]
    end
    image.link = params[:file]
    image.save!
    render json: {
      image: {
        url: image.link.url
      }
    }, content_type: "text/html"
  end
end

