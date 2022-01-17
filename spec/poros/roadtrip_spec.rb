require 'rails_helper'

RSpec.describe Roadtrip, type: :model do

  describe 'relationships' do
    it { should belong_to :user }
  end

end
