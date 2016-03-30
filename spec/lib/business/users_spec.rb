require 'rails_helper'

describe Business::Users do

  let(:business) { Business::Users.new }

  describe '#create' do

    context 'with valid params' do
      let(:valid_attributes) { attributes_for(:user) }

      it 'creates a new User' do
        expect {
          business.create(valid_attributes)
        }.to change(User, :count).by(1)
      end

      it 'returns a User' do
        expect(business.create(valid_attributes)).to be_kind_of(User)
      end

      describe 'the returned user' do

        subject(:user) { business.create(valid_attributes) }

        its(:valid?)       { should be(true) }
        its(:email)        { should eq(valid_attributes[:email]) }
        its(:theme)        { should eq(valid_attributes[:theme]) }
        its(:notification) { should eq(valid_attributes[:notification]) }

      end

    end

    context 'with invalid params' do
      let(:invalid_attributes) { attributes_for(:user).merge(email: 'im_not_a_valid_email.org') }

      it 'does not create a new User' do
        expect {
          business.create(invalid_attributes)
        }.to_not change(User, :count)
      end

      it 'returns a User' do
        expect(business.create(invalid_attributes)).to be_kind_of(User)
      end

      describe 'the returned user' do

        subject { business.create(invalid_attributes) }

        its(:valid?)       { should be(false) }
        its(:email)        { should eq(invalid_attributes[:email]) }
        its(:theme)        { should eq(invalid_attributes[:theme]) }
        its(:notification) { should eq(invalid_attributes[:notification]) }

      end
    end

  end

  describe '#create_from_google_oauth2' do

    context 'with valid params' do
      let(:valid_attributes) { attributes_for(:user).merge(password: nil,
                                                           provider: Enums::Providers::TWITTER) }


      it 'creates a new User' do
        expect {
          business.create_from_google_oauth2(valid_attributes)
        }.to change(User, :count).by(1)
      end

      it 'returns a User' do
        expect(business.create_from_google_oauth2(valid_attributes)).to be_kind_of(User)
      end

      describe 'the returned user' do

        subject(:user) { business.create_from_google_oauth2(valid_attributes) }

        its(:valid?)       { should be(true) }
        its(:email)        { should eq(valid_attributes[:email]) }
        its(:theme)        { should eq(valid_attributes[:theme]) }
        its(:notification) { should eq(valid_attributes[:notification]) }

      end

    end

    context 'with invalid params' do
      let(:invalid_attributes) { attributes_for(:user).merge(email: 'im_not_a_valid_email.org') }

      it 'does not create a new User' do
        expect {
          business.create_from_google_oauth2(invalid_attributes)
        }.to_not change(User, :count)
      end

      it 'returns a User' do
        expect(business.create_from_google_oauth2(invalid_attributes)).to be_kind_of(User)
      end

      describe 'the returned user' do

        subject { business.create_from_google_oauth2(invalid_attributes) }

        its(:valid?)       { should be(false) }
        its(:email)        { should eq(invalid_attributes[:email]) }
        its(:theme)        { should eq(invalid_attributes[:theme]) }
        its(:notification) { should eq(invalid_attributes[:notification]) }

      end
    end

  end

end
