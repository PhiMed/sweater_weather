require 'rails_helper'

describe 'Roadtrip API' do
  it "can create a roadtrip" do
    json_payload = {
                    "email": "whatever@example.com",
                    "password": "password",
                    "password_confirmation": "password"
                    }
    post '/api/v1/users', params: json_payload, as: :json

    response_hash = JSON.parse(response.body, symbolize_names: true)[:data]
    api_key = response_hash[:attributes][:api_key]

    json_payload = {
                    "origin": "Los Angeles, CA",
                    "destination": "Denver, CO",
                    "api_key": api_key
                                      }
    post '/api/v1/road_trip', params: json_payload, as: :json

    response_hash = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response_hash).to have_key(:id)
    expect(response_hash[:id]).to be nil
    expect(response_hash[:attributes][:start_city]).to eq("Los Angeles, CA")
    expect(response_hash[:attributes][:end_city]).to eq("Denver, CO")
    expect(response_hash[:attributes][:travel_time]).not_to be nil
    expect(response_hash[:attributes][:weather_at_eta]).to be_a Hash
    expect(response_hash[:attributes][:weather_at_eta][:temperature]).to be > -20
    expect(response_hash[:attributes][:weather_at_eta][:conditions]).to be_a String
  end
end
