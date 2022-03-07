require 'rails_helper'

RSpec.describe 'The user API' do
  describe "can register a new user" do
    it 'happy path' do
      new_user = {
                  "email": "whatever@example.com",
                  "password": "password",
                  "password_confirmation": "password"
                  }

      post "/api/v1/users", params: new_user, as: :json

      expect(response).to be_successful

      new_user = JSON.parse(response.body, symbolize_names: true)
      new_user_data = new_user[:data]

      expect(new_user_data).to have_key(:id)
      expect(new_user_data[:id]).to be_a(String)

      expect(new_user_data[:attributes]).to have_key(:email)
      expect(new_user_data[:attributes][:email]).to be_a(String)

      expect(new_user_data[:attributes]).to have_key(:api_key)
      expect(new_user_data[:attributes][:api_key]).to be_a(String)
    end

    it 'sad path: insufficient params' do
      new_user = {
                  "password": "password",
                  "password_confirmation": "password"
                  }

      post "/api/v1/users", params: new_user, as: :json

      return_value = JSON.parse(response.body, symbolize_names: true)
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(return_value[:message]).to eq("Email is invalid and Email can't be blank")
    end
  end
end
