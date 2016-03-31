require 'rails_helper'

describe Authentication, skip_login: true do

  controller(Api::BaseController) do
    def index
      render json: { status: :ok }
    end
  end

  let(:user) { create(:user) }

  describe '#current_user' do

    before { authenticate_user(user) }

    it 'returns the authenticated user' do
      expect(controller.current_user).to eq(user)
    end

    context 'if current user no longer exists' do
      before { user.destroy }

      it 'returns nil' do
        expect(controller.current_user).to be_nil
      end
    end

  end

  describe '#require_authentication' do

    context 'when there is valid authentication data' do
      before { request.headers['X-AUTH-TOKEN'] = user.authentication_token }

      it 'returns a success response' do
        get :index

        expect(response.status).to eq(200)
      end

      it 'returns the expected response' do
        get :index

        expect(response.body).to eq({ status: :ok }.to_json)
      end
    end

    context 'when there is no authentication data' do
      before { request.headers['X-AUTH-TOKEN'] = nil }

      it 'returns an unauthorized response' do
        get :index

        expect(response.status).to eq(401)
      end

      it 'returns an invalid session message' do
        get :index

        expect(response.body).to eq({ messages: [I18n.t('session.invalid_token')] }.to_json)
      end
    end

    context 'when there is invalid authentication data' do
      before { request.headers['X-AUTH-TOKEN'] = 'invalid' }

      it 'returns an unauthorized response' do
        get :index

        expect(response.status).to eq(401)
      end

      it 'returns an invalid session message' do
        get :index

        expect(response.body).to eq({ messages: [I18n.t('session.invalid_token')] }.to_json)
      end
    end

  end

end