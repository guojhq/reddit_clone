class CreateStaticImages < ActiveRecord::Migration
  def change
    create_table :static_images do |t|

      t.timestamps
    end
  end
end
