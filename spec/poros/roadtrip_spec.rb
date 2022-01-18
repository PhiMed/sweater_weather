require 'rails_helper'

describe Roadtrip do
  before :each do
    data = {
            :start_city=>"Los Angeles, CA",
            :end_city=>"New York City, NY",
            :travel_time=>"40:21:05",
            :weather_at_eta=>
              {:temperature=>38.21,
               :conditions=>"overcast clouds"}
             }
    @roadtrip = Roadtrip.new(data)
  end

  it 'exists' do
    expect(@roadtrip).to be_an_instance_of(Roadtrip)
  end

  it 'attributes' do
      expect(@roadtrip.start_city).to eq("Los Angeles, CA")
      expect(@roadtrip.end_city).to eq("New York City, NY")
      expect(@roadtrip.travel_time).to eq("40:21:05")
      expect(@roadtrip.weather_at_eta).to be_a Hash
  end
end
