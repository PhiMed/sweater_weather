require 'rails_helper'

describe 'Sessions API' do
  it 'can log in an existing user' do
    json_payload = {
                    "email": "whatever@example.com",
                    "password": "password",
                    "password_confirmation": "password"
                    }
    post '/api/v1/users', params: json_payload, as: :json

    json_payload = {
                    "email": "whatever@example.com",
                    "password": "password"
                    }
    post '/api/v1/sessions', params: json_payload, as: :json

    response_hash = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response_hash).to have_key(:id)
    expect(response_hash[:id].to_i).to be > 0
    expect(response_hash[:attributes][:email]).to eq("whatever@example.com")
    expect(response_hash[:attributes]).not_to have_key(:password)
    expect(response_hash[:attributes]).not_to have_key(:password_confirmation)
    expect(response_hash[:attributes]).to have_key(:api_key)
    expect(response_hash[:attributes][:api_key].split('').count).to eq 32
  end
end
