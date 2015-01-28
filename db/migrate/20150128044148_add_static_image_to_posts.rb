class AddStaticImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :static_image, :string
    add_index :posts, :static_image
  end
end
