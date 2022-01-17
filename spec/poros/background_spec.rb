require 'rails_helper'

describe Background do
  it 'exists' do
    location = "Denver, CO"
    background = Background.new(background_data, location)
    expect(background).to be_an_instance_of(Background)
  end

  it 'attributes' do
    location = "Denver, CO"
    background = Background.new(background_data, location)

    #background_data is in rails_helper

    expect(background.location).to eq("Denver, CO")
    expect(background.img_url).to eq("https://images.unsplash.com/photo-1634507307799-ace9b49840b7")
    expect(background.credit[:source]).to eq("unsplash.com")
    expect(background.credit[:author]).to eq("Dillon Wanner")
  end
end
