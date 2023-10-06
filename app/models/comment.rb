class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  # Custom Method: Update the comments counter for a post
  after_save :update_post_comment_counter

  private

  def update_post_comment_counter
    post.increment!(:comments_counter)
  end
end
