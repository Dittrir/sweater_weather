require 'rails_helper'

RSpec.describe 'The session API' do
  describe "can start a new session" do
    it 'happy path' do
      new_user = {
                  "email": "whatever@example.com",
                  "password": "password",
                  "password_confirmation": "password"
                  }

      post "/api/v1/users", params: new_user, as: :json

      new_session = {
                  "email": "whatever@example.com",
                  "password": "password"
                  }

      post "/api/v1/sessions", params: new_session, as: :json

      expect(response).to be_successful

      new_session = JSON.parse(response.body, symbolize_names: true)
      new_session_data = new_session[:data]

      expect(new_session_data).to have_key(:id)
      expect(new_session_data[:id]).to be_a(String)

      expect(new_session_data[:attributes]).to have_key(:email)
      expect(new_session_data[:attributes][:email]).to be_a(String)

      expect(new_session_data[:attributes]).to have_key(:api_key)
      expect(new_session_data[:attributes][:api_key]).to be_a(String)
    end
  end
end
