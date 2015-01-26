class StaticImage < ActiveRecord::Base
  mount_uploader :link, ImageUploader
end
