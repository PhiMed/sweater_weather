require 'rails_helper'

describe 'Backgrounds API' do
  it 'can return a background hash for a location' do
    location = "Denver, CO"

    get "/api/v1/backgrounds?location=#{location}"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response_body[:type]).to eq("background")
  end
end
