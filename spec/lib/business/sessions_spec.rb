require 'rails_helper'

describe Business::Sessions do

  let(:business) { Business::Sessions.new }

  describe '#create' do

    let(:email)         { 'me@tugg.com' }
    let(:password)      { '123456me' }

    it 'returns a CustomSession' do
      expect(business.create(email, password)).to be_kind_of(CustomSession)
    end

    describe 'the returned session' do

      subject(:session) { business.create(email, password) }

      context 'when the a user with the given email does not exist' do
        its(:valid?)  { should be(false) }

        it 'adds an invalid data error' do
          expect(session.errors.full_messages).to eq(['E-mail/Password is incorrect'])
        end
      end

      context 'when the email and password are blank' do
        let(:email)     { '' }
        let(:password)  { '' }

        its(:valid?)    { should be(false) }

        it 'adds an invalid data error' do
          expect(session.errors.full_messages).to eq(['E-mail/Password is incorrect'])
        end
      end

      context 'when the email is blank' do
        let(:email)   { '' }

        its(:valid?)  { should be(false) }

        it 'adds an invalid data error' do
          expect(session.errors.full_messages).to eq(['E-mail/Password is incorrect'])
        end
      end

      context 'when the password is blank' do
        let(:password)  { '' }

        its(:valid?)    { should be(false) }

        it 'adds an invalid data error' do
          expect(session.errors.full_messages).to eq(['E-mail/Password is incorrect'])
        end
      end

      context 'when the a user with the given email exists' do
        let!(:user)   { create(:user, email: email, password: password) }

        its(:valid?)  { should be(true) }
        its(:user)    { should eq(user) }

        it 'does not add an invalid data error' do
          expect(session.errors.full_messages).to eq([])
        end

        context 'but the given password is invalid' do
          subject(:session) { business.create(email, 'invalid') }

          its(:valid?)      { should be(false) }

          it 'adds an invalid data error' do
            expect(session.errors.full_messages).to eq(['E-mail/Password is incorrect'])
          end
        end

      end
    end

  end

end