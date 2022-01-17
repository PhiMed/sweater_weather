require 'rails_helper'

describe 'Users API' do
  xit 'can get all users' do
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

  xit "can get one user by their id" do
    id = create(:user).id

    get "/api/v1/users/#{id}"

    user = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(response).to be_successful

    expect(user[:attributes][:email]).to be_a(String)
  end

  xit 'sends an error code if user does not exist' do
    get "/api/v1/users/1000"

    error = (JSON.parse(response.body, symbolize_names: true))[:errors][:details]

    expect(response.status).to eq(404)
    expect(error).to eq("Not Found")
  end

  xit 'can create a new user' do
    user = User.new(id: 8, name: 'bob', email: 'cats@cats.com', phone: '123-2345', rescuer_trailer_capacity: 10, address: '123 street')

    post "/api/v1/users?email=#{user.email}"

    expect(response.status).to eq(201)

    get "/api/v1/users?id=#{user.id}"

    user = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(response).to be_successful
  end

  xit 'can update a user' do

  end

  xit 'sends an error code if a user is not updated' do
    user_1 = create(:user)

    user_params = {
          email: ""
                  }

    header = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/users/#{user_1.id}", headers: header, params: JSON.generate(user_params)

    expect(response.status).to eq(400)
  end

  xit 'can delete a user' do
    user_1 = create(:user)
    user_2 = create(:user)

    expect(User.count).to eq(2)

    delete "/api/v1/users/#{user_1.id}"

    expect(response).to be_successful

    expect(User.count).to eq(1)
  end

end
