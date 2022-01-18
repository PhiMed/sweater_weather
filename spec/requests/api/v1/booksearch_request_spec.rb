require 'rails_helper'

describe 'Book-search API' do
  it 'can return a book-search for a location' do
    location = "Denver, CO"

    get "/api/v1/book-search?location=#{location}"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response_body[:type]).to eq("booksearch")
    expect(response_body[:attributes][:destination]).to eq("Denver, CO")
    expect(response_body[:attributes][:forecast]).to be_a Hash
    expect(response_body[:attributes][:forecast][:summary]).to eq("weather goes here")
    expect(response_body[:attributes][:forecast][:temperature]).to eq("83 F")
    expect(response_body[:attributes][:total_books_found]).to eq 172
    expect(response_body[:attributes][:books]).to be_an Array
    expect(response_body[:attributes][:books].count).to eq 5
  end
end
