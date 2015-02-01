class AddCachedImagesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :cached_images, :text
  end
end
