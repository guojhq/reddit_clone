class StaticImagesController < ApplicationController
  respond_to :json

  def create
    image = StaticImage.new
    image.link = params[:file]
    image.save!
    # render json in controller, don't use to_json
    render json: {
      image: {
        url: image.link.url
      }
    }, content_type: "text/html"
  end
end

