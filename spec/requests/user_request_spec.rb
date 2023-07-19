require 'rails_helper'

RSpec.describe User, type: :request do
  describe 'users controller' do
    it 'should render the users index' do
      get users_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template('users/index')
      expect(response.body).to include('show all users')
    end

    it 'should render the user show' do
      get '/users/:id'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('users/show')
      expect(response.body).to include('show a particular user')
    end
  end
end
