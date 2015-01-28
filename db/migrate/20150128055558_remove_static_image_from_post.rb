class RemoveStaticImageFromPost < ActiveRecord::Migration
  def change
    remove_index :posts, :static_image
    remove_column :posts, :static_image, :string
  end
end
