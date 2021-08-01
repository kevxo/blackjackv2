require 'rails_helper'

describe 'Users API' do
  before(:each) do
    @user1 = {
      'username': 'player123',
      'password': 'fakepass123',
      'password_confirmation': 'fakepass123'
    }

    @user2 = {
      'username': 'player123',
      'password': 'fakepass123',
      'password_confirmation': 'fakepass123'
    }

    @user3 = {
      'username': 'player123',
      'password': 'fakepass123',
      'password_confirmation': 'fakepass'
    }

    @user4 = {
      'username': '',
      'password': 'fakepass123',
      'password_confirmation': 'fakepass123'
    }
  end

  it 'should create a User' do
    post '/api/v1/users', params: @user1.to_json,
                          headers: { 'Content-Type' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to redirect_to '/'
    expect(response.status).to eq 302
  end

  it 'should give error with taken username' do
    post '/api/v1/users', params: @user1.to_json,
                          headers: { 'Content-Type' => 'application/json', 'ACCEPT' => 'application/json' }

    post '/api/v1/users', params: @user2.to_json,
                          headers: { 'Content-Type' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to redirect_to '/'
    expect(response.status).to eq(302)
  end

  it 'should error password does not match' do
    post '/api/v1/users', params: @user3.to_json,
                          headers: { 'Content-Type' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to redirect_to '/'
    expect(response.status).to eq(302)
  end

  it 'can\'t have a blank username' do
    post '/api/v1/users', params: @user4.to_json,
                          headers: { 'Content-Type' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to redirect_to '/'
    expect(response.status).to eq(302)
  end
end
