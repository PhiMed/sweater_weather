require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
  end

  describe 'attributes' do
    it 'generates its own API key upon creation' do
      user = User.new(email: 'test@test.com',
                      password: '1234',
                      password_confirmation: '1234')
      expect(user.api_key).to be nil
      user.save
      expect(user.api_key).to be_a String
      expect(user.api_key.split('').count).to eq 32
    end
  end
end
