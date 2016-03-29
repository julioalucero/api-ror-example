require 'rails_helper'

describe Api::V1::UsersController, type: :controller do

  describe 'POST create', skip_login: true do

    context 'with valid params' do
      let(:valid_attributes) { attributes_for(:user) }

      it 'creates a new User' do
        expect {
          post :create, valid_attributes
        }.to change(User, :count).by(1)
      end

      it 'returns a success response' do
        post :create, valid_attributes

        expect(response.status).to eq(200)
      end

      it 'returns the new user' do
        post :create, valid_attributes

        user = User.last

        expect(response.body).to match_json(:user, :user, user)
      end

      describe 'the created user' do

        before { post :create, valid_attributes }

        subject { User.last }

        its(:email)        { should eq(valid_attributes[:email]) }
        its(:theme)        { should eq(valid_attributes[:theme]) }
        its(:notification) { should eq(valid_attributes[:notification]) }
      end

    end

    context 'with invalid params' do
      let(:invalid_attributes) { { email: 'im_not_a_valid_email.org' } }

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
