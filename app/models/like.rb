# frozen_string_literal: true

class Like < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  # Callback
  after_save :increment_likes_counter_for_post
  after_destroy :decrement_likes_counter_for_post

  # Method
  def increment_likes_counter_for_post
    post.increment!(:likes_counter)
  end

  def decrement_likes_counter_for_post
    post.decrement!(:likes_counter)
  end
end
