# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create(name: 'test user') }
  let(:post) { user.posts.create(title: 'Test Post') }

  describe 'GET /index' do
    before(:example) { get user_posts_path(user) }

    it 'displays a list of posts' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('post index')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_post_path(user, post) }

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('post show')
    end
  end
end
