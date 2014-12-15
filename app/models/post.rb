class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  mount_uploader :image, ImageUploader
  # The default scope declaration above will order all posts by their created_at date, in descending order.
  default_scope { order('created_at DESC') }
  # scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }
  # scope :ordered_by_title, -> { order('title')}

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true
end
