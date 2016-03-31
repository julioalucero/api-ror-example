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

  describe '.token_cached' do

    it 'returns the user that matches the given token' do
      expect(User.token_cached(user.authentication_token)).to eq(user)
    end

    it 'returns nil when no user has the given token' do
      expect(User.token_cached('invalid')).to be_nil
    end

    it 'returns nil when token is nil' do
      expect(User.token_cached(nil)).to be_nil
    end

  end

end