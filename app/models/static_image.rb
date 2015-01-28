class StaticImage < ActiveRecord::Base
  belongs_to :post
  belongs_to :comment
  mount_uploader :link, ImageUploader
end
