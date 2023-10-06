class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_post_counter
  # Custom Method: Update the posts counter for a user
  def update_post_counter
    author.increment!(:posts_counter)
  end
end
