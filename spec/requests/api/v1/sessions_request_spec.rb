require 'rails_helper'

describe 'Sessions' do
  it 'user can login' do
    user = create(:user)

    login = {
      'username': user.username,
      'password': user.password
    }

    post '/api/v1/sessions', params: login.to_json,
                              headers: { 'Content-Type' => 'application/json'}

    expect(response.status).to eq(302)
  end

  it 'cannot login with invalid credentials' do
    user = create(:user)

    login = {
      'username': user.username,
      'password': 'nvjsbkjvbd'
    }

    post '/api/v1/sessions', params: login.to_json,
    headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to_not be_successful
    expect(response).to redirect_to "/"
    expect(response.status).to eq(302)
  end
end