require 'rails_helper'

describe Api::V1::SessionsController, skip_login: true do

  describe 'POST create' do

    let(:user) { create(:user) }

    context 'with valid params' do
      let(:valid_attributes) { { email: user.email, password: user.password } }

      it 'returns a success response' do
        post :create, valid_attributes

        expect(response.status).to eq(200)
      end

      it 'updates the user authentication token' do
        expect {
          post :create, valid_attributes
          user.reload
        }.to change(user, :authentication_token)
      end

      it 'returns the user for the session' do
        post :create, valid_attributes

        user.reload

        expect(response.body).to match_json(:user, :user, user)
      end

    end

    context 'with invalid params' do
      let(:invalid_attributes) { { email: '', password: '' } }

      it 'returns an error response' do
        post :create, invalid_attributes

        expect(response.status).to eq(422)
      end

      it 'returns the user error messages' do
        post :create, invalid_attributes

        expect(JSON(response.body)['messages']).to_not be_empty
      end
    end

  end

end
