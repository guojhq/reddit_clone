class AddEmailFavoritesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_favorites, :integer
  end
end
