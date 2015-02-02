class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  belongs_to :user
  belongs_to :topic
  # The default scope declaration above will order all posts by their created_at date, in descending order.
  #default_scope { order('created_at DESC') }
  # scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }
  # scope :ordered_by_title, -> { order('title')}

  default_scope { order('rank DESC') }
  scope :visible_to, -> (user) { user ? all : joins(:topic).where('topics.public' => true) }
  
  # Define the scope to return top 10 posts in descending order
  scope :top_ten, -> (user) { user ? Post.limit(10) : joins(:topic).where('topics.public' => true) }

  validates :title, length: { minimum: 2 }, presence: true
  validates :body, length: { minimum: 10 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  # user after_create instead of after_save to avoid overhead create_vote call when updating post

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24)
    new_rank = points + age_in_days

    update_attribute(:rank, new_rank)
  end

  def create_vote
    user.votes.create(value: 1, post: self)
  end

  def all_tags=(names)
     self.tags = names.split(" ").map do |name|
       Tag.where(name: name.strip).first_or_create!
     end
  end

  def all_tags
    self.tags.map(&:name).join(" ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  def self.top_ten_posts 
     self.select('COUNT(DISTINCT comments.id) AS rank') 
       .select('posts.*') # Select all attributes of the post
       .joins(:comments) # Ties the comments table to the post table, via the post_id
       .group('posts.id') # Instructs the database to group the results so that each post will be returned in a distinct row
       .order('rank DESC') # Instructs the database to order the results in descending order, by the rank that we created in this query. (rank = comment count + post count)
       .limit(10)
  end

end
