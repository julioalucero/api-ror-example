require 'rails_helper'

describe User do

  let(:user) { create(:user) }

  describe '#generate_authentication_token!' do

    it 'generates a new authentication_token for the user' do
      expect {
        user.generate_authentication_token!
      }.to change(user, :authentication_token)
    end

  end
end