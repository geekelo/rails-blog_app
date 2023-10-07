require 'rails_helper'
RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Bob Happy', posts_counter: 0) }
  let(:post) { Post.create(author: user, title: 'Hello World') }
  it 'should not create a post without title' do
    post.title = nil
    expect(post.valid?).to eq false
  end
  it 'should not create post with like/comment counter < 0' do
    post.comments_counter = -1
    post.likes_counter = -1
    expect(post).not_to be_valid
  end
  it 'should not create post with like/comment counter not an integer' do
    post.comments_counter = 'Hi'
    post.likes_counter = 'Hi'
    expect(post.valid?).to eq false
  end
  it 'should create post with a title under 250 characters' do
    post.title = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
    expect(post).to be_valid
  end
  it 'should update the user posts_counter' do
    user = User.create(name: 'Eloghene', posts_counter: 0)
    Post.create(author: user, title: 'Hello World')
    expect(user.reload.posts_counter).to eq(1)
  end
  it 'retrieves recent comments' do
    comment1 = Comment.create(author: user, post: post, text: 'this is a comment')
    comment2 = Comment.create(author: user, post: post, text: 'this is a comment')
    comment3 = Comment.create(author: user, post: post, text: 'this is a comment')
    comment4 = Comment.create(author: user, post: post, text: 'this is a comment')
    comment5 = Comment.create(author: user, post: post, text: 'this is a comment')
    recent_comments = post.recent_comments
    expect(recent_comments).to eq([comment5, comment4, comment3, comment2, comment1])
  end
end
