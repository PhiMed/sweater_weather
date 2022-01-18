require 'rails_helper'

describe 'Roadtrip API' do
  before :each do
    json_payload = {
                    "email": "whatever@example.com",
                    "password": "password",
                    "password_confirmation": "password"
                    }
    post '/api/v1/users', params: json_payload, as: :json

    response_hash = JSON.parse(response.body, symbolize_names: true)[:data]
    @api_key = response_hash[:attributes][:api_key]
  end

  it "can create a roadtrip" do

    json_payload = {
                    "origin": "Los Angeles, CA",
                    "destination": "Denver, CO",
                    "api_key": @api_key
                                      }
    post '/api/v1/road_trip', params: json_payload, as: :json

    response_hash = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response_hash).to have_key(:id)
    expect(response_hash[:id]).to be nil
    expect(response_hash[:type]).to eq("roadtrip")
    expect(response_hash[:attributes][:start_city]).to eq("Los Angeles, CA")
    expect(response_hash[:attributes][:end_city]).to eq("Denver, CO")
    expect(response_hash[:attributes][:travel_time]).not_to be nil
    expect(response_hash[:attributes][:weather_at_eta]).to be_a Hash
    expect(response_hash[:attributes][:weather_at_eta][:temperature]).to be > -20
    expect(response_hash[:attributes][:weather_at_eta][:conditions]).to be_a String
  end

  it "verifies user has a valid API key" do
    json_payload = {
                    "origin": "Los Angeles, CA",
                    "destination": "Denver, CO",
                    "api_key": "i want to be a triangle"
                                      }
    post '/api/v1/road_trip', params: json_payload, as: :json

    response_hash = JSON.parse(response.body, symbolize_names: true)

    expect(response_hash[:errors][:details]).to eq("Unauthorized - Valid API key required")
    expect(response_hash[:status]).to eq 401
  end

  it "can handle missing fields" do
    json_payload = {
                    "origin": "",
                    "destination": "Denver, CO",
                    "api_key": @api_key
                                      }
    post '/api/v1/road_trip', params: json_payload, as: :json

    response_hash = JSON.parse(response.body, symbolize_names: true)

    expect(response_hash[:errors][:details]).to eq("Both origin and destination are required")
    expect(response_hash[:status]).to eq 400
  end

  it "can handle impossible requests" do
    json_payload = {
                    "origin": "Los Angeles, CA",
                    "destination": "St. Cloud, FR",
                    "api_key": @api_key
                                      }
    post '/api/v1/road_trip', params: json_payload, as: :json

    response_hash = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response_hash[:attributes][:travel_time]).to eq "Impossible"
    expect(response_hash[:attributes][:weather_at_eta]).to eq ""
  end

  it "can handle very short trips" do
    json_payload = {
                    "origin": "Denver, CO",
                    "destination": "Golden, CO",
                    "api_key": @api_key
                                      }
    post '/api/v1/road_trip', params: json_payload, as: :json

    response_hash = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response_hash[:attributes][:travel_time]).not_to be nil
    expect(response_hash[:attributes][:weather_at_eta]).to be_a Hash
    expect(response_hash[:attributes][:weather_at_eta][:temperature]).to be > -20
    expect(response_hash[:attributes][:weather_at_eta][:conditions]).to be_a String
  end

  it "can handle very long trips" do
    json_payload = {
                    "origin": "Anchorage, AK",
                    "destination": "Miami, FL",
                    "api_key": @api_key
                                      }
    post '/api/v1/road_trip', params: json_payload, as: :json

    response_hash = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response_hash[:attributes][:travel_time]).not_to be nil
    expect(response_hash[:attributes][:weather_at_eta]).to be_a Hash
    expect(response_hash[:attributes][:weather_at_eta][:temperature]).to eq "Unavailable"
    expect(response_hash[:attributes][:weather_at_eta][:conditions]).to eq "Unavailable"
  end
end
