class AddStaticImageToComments < ActiveRecord::Migration
  def change
    add_column :comments, :static_image, :string
    add_index :comments, :static_image
  end
end
