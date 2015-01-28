class RemoveCommentToStaticImages < ActiveRecord::Migration
  def change
    remove_index :static_images, :comment_id
    remove_column :static_images, :comment_id, :integer
  end
end
