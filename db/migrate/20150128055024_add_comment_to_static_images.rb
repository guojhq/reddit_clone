class AddCommentToStaticImages < ActiveRecord::Migration
  def change
    add_column :static_images, :comment_id, :integer
    add_index :static_images, :comment_id
  end
end
