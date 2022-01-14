require 'rails_helper'

describe 'Backgrounds API' do
  it 'can get all backgrounds' do
    background_1 = create(:background)
    background_2 = create(:background)
    background_3 = create(:background)

    get "/api/v1/backgrounds"

    expect(response).to be_successful

    backgrounds = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(backgrounds.count).to eq(3)

    backgrounds.each do |background|
      expect(background[:attributes]).to have_key(:name)
      expect(background[:attributes][:path]).to be_a(String)
    end
  end

  it "can get one background by their id" do
    id = create(:background).id

    get "/api/v1/backgrounds/#{id}"

    background = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(response).to be_successful

    expect(background[:attributes][:path]).to be_a(String)
  end
