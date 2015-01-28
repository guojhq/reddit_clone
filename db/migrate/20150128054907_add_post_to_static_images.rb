class AddPostToStaticImages < ActiveRecord::Migration
  def change
    add_column :static_images, :post_id, :integer
    add_index :static_images, :post_id
  end
end
