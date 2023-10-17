# frozen_string_literal: true

class Like < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  # Callback
  after_save :update_likes_counter_for_post

  # Method
  def update_likes_counter_for_post
    post.increment!(:likes_counter)
  end
end
