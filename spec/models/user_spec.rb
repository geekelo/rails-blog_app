require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Bob Anderson', posts_counter: 0) }

  it 'should save user with valid attributes' do
    expect(user.valid?).to eq true
  end

  it 'should not save user without name' do
    user.name = nil
    expect(user).not_to be_valid
  end

  it 'should not save user without posts_counter' do
    user.posts_counter = nil
    expect(user).not_to be_valid
  end

  it 'should not save user with negative posts_counter' do
    user.posts_counter = -1
    expect(user.valid?).to eq false
  end

  it 'should not save a user if posts_counter is not an integer' do
    user.posts_counter = 'Hi'
    expect(user).not_to be_valid
  end

  it 'retrieves recent posts' do
    3.times { Post.create(author: user, title: 'Hello World', text: 'This is my first post') }
    expect(user.recent_posts.to_a).to eq user.posts.order(created_at: :desc).limit(3).to_a
  end
end
