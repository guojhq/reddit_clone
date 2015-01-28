class RemoveStaticImageFromComments < ActiveRecord::Migration
  def change
    remove_index :comments, :static_image
    remove_column :comments, :static_image, :string
  end
end
