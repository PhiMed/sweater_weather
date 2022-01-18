require 'rails_helper'

RSpec.describe 'forecast' do
  it 'returns a forecast' do
    location = "Denver, CO"

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response_body[:type]).to eq("forecast")

    expect(response_body[:attributes][:current_weather]).to have_key(:datetime)
    expect(response_body[:attributes][:current_weather][:datetime]).not_to be nil
    expect(response_body[:attributes][:current_weather]).to have_key(:sunrise)
    expect(response_body[:attributes][:current_weather][:sunrise]).not_to be nil
    expect(response_body[:attributes][:current_weather]).to have_key(:sunset)
    expect(response_body[:attributes][:current_weather][:sunset]).not_to be nil
    expect(response_body[:attributes][:current_weather]).to have_key(:temperature)
    expect(response_body[:attributes][:current_weather][:temperature]).not_to be nil
    expect(response_body[:attributes][:current_weather]).to have_key(:feels_like)
    expect(response_body[:attributes][:current_weather][:feels_like]).not_to be nil
    expect(response_body[:attributes][:current_weather]).to have_key(:humidity)
    expect(response_body[:attributes][:current_weather][:humidity]).not_to be nil
    expect(response_body[:attributes][:current_weather]).to have_key(:uvi)
    expect(response_body[:attributes][:current_weather][:uvi]).not_to be nil
    expect(response_body[:attributes][:current_weather]).to have_key(:visibility)
    expect(response_body[:attributes][:current_weather][:visibility]).not_to be nil
    expect(response_body[:attributes][:current_weather]).to have_key(:conditions)
    expect(response_body[:attributes][:current_weather][:conditions]).not_to be nil
    expect(response_body[:attributes][:current_weather]).to have_key(:icon)
    expect(response_body[:attributes][:current_weather][:icon]).not_to be nil
    expect(response_body[:attributes][:current_weather]).not_to have_key(:pressure)
    expect(response_body[:attributes][:current_weather]).not_to have_key(:wind_deg)

    expect(response_body[:attributes][:daily_weather]).to be_an Array
    expect(response_body[:attributes][:daily_weather].count).to eq 5
    expect(response_body[:attributes][:daily_weather][0]).to have_key(:sunrise)
    expect(response_body[:attributes][:daily_weather][0][:sunrise]).not_to be nil

    expect(response_body[:attributes][:hourly_weather]).to be_an Array
    expect(response_body[:attributes][:hourly_weather].count).to eq 8
  end
end
