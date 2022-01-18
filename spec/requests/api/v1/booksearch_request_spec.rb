require 'rails_helper'

describe 'Book-search API' do
  it 'can return a book-search for a location' do
    location = "Denver, CO"
    quantity = 5

    get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response_body[:type]).to eq("books")
    expect(response_body[:attributes][:destination]).to eq("Denver, CO")
    expect(response_body[:attributes][:forecast]).to be_a Hash
    expect(response_body[:attributes][:forecast][:summary]).to be_a String
    expect(response_body[:attributes][:forecast][:temperature]).to be_a String
    expect(response_body[:attributes][:total_books_found]).to be > 5
    expect(response_body[:attributes][:books]).to be_an Array
    expect(response_body[:attributes][:books].count).to eq 5
  end

  it 'edge case - it can return all results if quantity of results is less than
        quantity requested' do
        
    location = "Farmington, NM"
    quantity = 80

    get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)[:data]


    expect(response_body[:attributes][:total_books_found]).to be < 80
    expect(response_body[:attributes][:books]).to be_an Array
    expect(response_body[:attributes][:books].count).to be < 80
  end
end
