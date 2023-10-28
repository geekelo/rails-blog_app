# frozen_string_literal: true

class Comment < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  # Attributes
  attribute :text, :text

  # Callback
  after_save :increment_comments_counter_for_post
  after_destroy :decrement_comments_counter_for_post

  # Methods
  def increment_comments_counter_for_post
    post.increment!(:comments_counter)
  end
  def decrement_comments_counter_for_post
    post.decrement!(:comments_counter)
  end
end
