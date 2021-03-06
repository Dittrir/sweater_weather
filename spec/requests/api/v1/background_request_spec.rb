require 'rails_helper'

RSpec.describe 'The background API' do
  describe "returns a background for a specific location" do
    it 'happy path', :vcr do
      location = "Bellingham, WA"

      get "/api/v1/backgrounds?location=#{location}"

      expect(response).to be_successful

      background = JSON.parse(response.body, symbolize_names: true)
      background_data = background[:data]

      expect(background_data).to have_key(:id)
      expect(background_data[:id]).to eq(nil)

      expect(background_data[:attributes]).to have_key(:image)
      expect(background_data[:attributes][:image]).to be_a(Hash)

      expect(background_data[:attributes][:image]).to have_key(:location)
      expect(background_data[:attributes][:image][:location]).to be_a(String)

      expect(background_data[:attributes][:image]).to have_key(:image_url)
      expect(background_data[:attributes][:image][:image_url]).to be_a(String)

      expect(background_data[:attributes][:image]).to have_key(:credit)
      expect(background_data[:attributes][:image][:credit]).to be_a(Hash)

      expect(background_data[:attributes][:image][:credit]).to have_key(:source)
      expect(background_data[:attributes][:image][:credit][:source]).to be_a(String)

      expect(background_data[:attributes][:image][:credit]).to have_key(:author)
      expect(background_data[:attributes][:image][:credit][:author]).to be_a(String)

      expect(background_data[:attributes][:image][:credit]).to have_key(:logo)
      expect(background_data[:attributes][:image][:credit][:logo]).to be_a(String)
    end

    it 'sad path: no results found', :vcr do
      get "/api/v1/backgrounds?location=NOMATCH"

      return_value = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(return_value[:data][:message]).to eq("There were no matches")
    end

    it 'edge case: no params given', :vcr do
      get "/api/v1/backgrounds"

      return_value = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(return_value[:data][:message]).to eq("Insufficent query parameters")
    end

    it 'edge case: no name given', :vcr do
      get "/api/v1/backgrounds?location="

      return_value = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(return_value[:data][:message]).to eq("Insufficent query parameters")
    end
  end
end
