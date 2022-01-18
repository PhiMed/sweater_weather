require 'rails_helper'

describe 'Backgrounds API' do
  it 'can return a background hash for a location' do
    location = "Denver, CO"

    get "/api/v1/backgrounds?location=#{location}"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response_body[:type]).to eq("background")
    expect(response_body[:attributes][:location]).to eq("Denver, CO")
    expect(response_body[:attributes][:img_url]).to be_a String
    expect(response_body[:attributes][:credit][:source]).to eq("unsplash.com")
    expect(response_body[:attributes][:credit][:author]).to be_a String
  end

  it 'displays a nice neutral picture of pebbles if for some
      reason there are no results for the location search' do
    location = "jdbgndfjnbfnb"

    get "/api/v1/backgrounds?location=#{location}"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response_body[:type]).to eq("background")
    expect(response_body[:attributes][:location]).to eq("jdbgndfjnbfnb")
    expect(response_body[:attributes][:img_url]).to be_a String
    expect(response_body[:attributes][:credit][:source]).to eq("unsplash.com")
    expect(response_body[:attributes][:credit][:author]).to be_a String
  end
end
