class AddLinkToStaticImages < ActiveRecord::Migration
  def change
    add_column :static_images, :link, :string
  end
end
