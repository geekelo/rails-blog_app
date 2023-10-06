class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_post_counter

  private

  # Custom Method: Get the 3 most recent posts for a user
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  # Custom Method: Update the posts counter for a user
  def update_post_counter
    author.increment!(:posts_counter)
  end
end
