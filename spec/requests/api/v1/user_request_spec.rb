require 'rails_helper'

describe 'Users API' do
  it 'can get all users' do
    user_1 = create(:user)
    user_2 = create(:user)
    user_3 = create(:user)

    get "/api/v1/users"

    expect(response).to be_successful

    users = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(users.count).to eq(3)

    users.each do |user|
      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes][:email]).to be_a(String)
    end
  end

  it "can get one user by their id" do
    id = create(:user).id

    get "/api/v1/users/#{id}"

    user = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(response).to be_successful

    expect(user[:attributes][:email]).to be_a(String)
  end

  it "can get one user by their email" do
    user_1 = create(:user, email: "user_1@gmail.com")
    user_2 = create(:user, email: "user_2@gmail.com")

    get "/api/v1/users/?email=user_2@gmail.com"

    user = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(response).to be_successful

    expect(user[:attributes][:email]).to eq("#{user_2.email}")
    expect(user[:attributes][:email]).to_not eq("#{user_1.email}")

  end

  it 'sends an error code if user does not exist' do
    get "/api/v1/users/1000"

    error = (JSON.parse(response.body, symbolize_names: true))[:errors][:details]

    expect(response.status).to eq(404)
    expect(error).to eq("Not Found")
  end

  it 'can create a new user' do

  end

  it 'can update a user' do

  end

  it 'sends an error code if a user is not updated' do
    user_1 = create(:user)

    user_params = {
          email: ""
                  }

    header = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/users/#{user_1.id}", headers: header, params: JSON.generate(user_params)

    expect(response.status).to eq(400)
  end

  it 'can delete a user' do
    user_1 = create(:user)
    user_2 = create(:user)

    expect(User.count).to eq(2)

    delete "/api/v1/users/#{user_1.id}"

    expect(response).to be_successful

    expect(User.count).to eq(1)
  end

end
