require 'rails_helper'

describe Api::V1::MeController do

  describe 'GET show' do

    it 'returns a success response' do
      get :show

      expect(response.status).to eq(200)
    end

    it 'returns the new user' do
      get :show

      expect(response.body).to match_json(:user, :user, current_user)
    end

  end

  describe 'PUT update' do

    let(:email) { 'user@stanford.edu' }

    before do
      current_user.update({ theme: '', notification: '', email: ''})

      current_user.save
    end

    context 'with valid params' do
      let(:valid_attributes) { { email: email } }

      it 'returns a success response' do
        get :update, valid_attributes

        expect(response.status).to eq(200)
      end

      it 'returns the user' do
        get :update, valid_attributes

        current_user.reload
        expect(response.body).to match_json(:user, :user, current_user)
      end

      it 'update the user email' do
        expect {
          put :update, valid_attributes
          current_user.reload
        }.to change(current_user, :email)
      end

    end

    context 'with invalid params' do

      let(:invalid_attributes) { { email: 'a bad email' } }

      it 'returns an error response' do
        post :update, invalid_attributes

        expect(response.status).to eq(422)
      end

      it 'returns a user error messages' do
        post :update, invalid_attributes

        expect(JSON(response.body)['messages']).to_not be_empty
      end
    end

  end

end
