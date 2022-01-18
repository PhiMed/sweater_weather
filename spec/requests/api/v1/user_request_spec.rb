require 'rails_helper'

describe 'Users API' do

  it 'can register a new user' do
    json_payload = {
                    "email": "whatever@example.com",
                    "password": "password",
                    "password_confirmation": "password"
                    }

    post '/api/v1/users', params: json_payload, as: :json

    expect(response.status).to eq(201)

    response_hash = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response_hash).to have_key(:id)
    expect(response_hash[:id].to_i).to be > 0
    expect(response_hash[:attributes][:email]).to eq("whatever@example.com")
    expect(response_hash[:attributes]).not_to have_key(:password)
    expect(response_hash[:attributes]).not_to have_key(:password_confirmation)
    expect(response_hash[:attributes]).to have_key(:api_key)
    expect(response_hash[:attributes][:api_key].split('').count).to eq 32
  end

  it 'returns a helpful error if something went wrong (email taken)' do
    json_payload = {
                    "email": "whatever@example.com",
                    "password": "password",
                    "password_confirmation": "password"
                    }

    post '/api/v1/users', params: json_payload, as: :json

    json_payload = {
                    "email": "whatever@example.com",
                    "password": "password",
                    "password_confirmation": "password"
                    }

    post '/api/v1/users', params: json_payload, as: :json

    response_hash = JSON.parse(response.body, symbolize_names: true)

    expect(response_hash[:errors][:details]).to eq("email=>has already been taken")
    expect(response_hash[:status]).to eq 400
  end

  it 'returns a helpful error if something went wrong (passwords dont match)' do
    json_payload = {
                    "email": "whatever@example.com",
                    "password": "password",
                    "password_confirmation": "i want to be a triangle"
                    }

    post '/api/v1/users', params: json_payload, as: :json

    response_hash = JSON.parse(response.body, symbolize_names: true)

    expect(response_hash[:errors][:details]).to eq("password_confirmation=>doesn't match Password")
    expect(response_hash[:status]).to eq 400
  end

  it 'returns a helpful error if something went wrong (missing field)' do
    json_payload = {
                    "email": "",
                    "password": "password",
                    "password_confirmation": "password"
                    }

    post '/api/v1/users', params: json_payload, as: :json

    response_hash = JSON.parse(response.body, symbolize_names: true)

    expect(response_hash[:errors][:details]).to eq("email=>can't be blank, is invalid")
    expect(response_hash[:status]).to eq 400
  end
end
