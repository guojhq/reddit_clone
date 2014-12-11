class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic
 # The default scope declaration above will order all posts by their created_at date, in descending order.
  default_scope { order('created_at DESC') }
  #scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }
  #scope :ordered_by_title, -> { order('title')}
end
