require 'rails_helper'

RSpec.describe PostsController, type: :request do
  let(:user) { User.create(name: 'John Doe') }

  describe 'GET /users/:user_id/posts' do
    it 'returns a successful response' do
      get user_posts_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get user_posts_path(user)
      expect(response.body).to include('post index')
    end
  end
end
