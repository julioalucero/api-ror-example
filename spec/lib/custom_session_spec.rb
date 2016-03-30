require 'rails_helper'

describe CustomSession, type: :model do

  describe 'validations' do

    let(:user)          { create(:user) }
    let(:session_attrs) { { email: user.email, password: user.password } }

    context 'when the email is empty' do
      before { session_attrs[:email] = '' }

      it 'adds an error on base' do
        session = CustomSession.new(session_attrs)

        session.valid?

        expect(session.errors).to include(:base)
      end
    end

    context 'when the password is empty' do
      before { session_attrs[:password] = '' }

      it 'adds an error on base' do
        session = CustomSession.new(session_attrs)

        session.valid?

        expect(session.errors).to include(:base)
      end
    end

    context 'when the email is invalid' do
      before { session_attrs[:email] = 'invalid' }

      it 'adds an error on base' do
        session = CustomSession.new(session_attrs)

        session.valid?

        expect(session.errors).to include(:base)
      end
    end

    context 'when the password is invalid' do
      before { session_attrs[:password] = 'invalid' }

      it 'adds an error on base' do
        session = CustomSession.new(session_attrs)

        session.valid?

        expect(session.errors).to include(:base)
      end
    end

  end

end