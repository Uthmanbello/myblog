require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    before do
      get '/users'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'includes user placeholder text' do
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe 'GET #show' do
    let(:user) { User.create(name: 'John Doe') }

    before do
      get "/users/#{user.id}"
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'includes user placeholder text' do
      expect(response.body).to include('Here is a list of all posts by the above user')
    end
  end
end
