# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'should update the post like counter' do
    user = User.create(name: 'Massam')
    post = Post.create(author: user, title: 'Hello World')
    Like.create(author: user, post: post)

    expect(post.reload.likes_counter).to eq(1)
  end
end
