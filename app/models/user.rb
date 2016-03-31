class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2, :twitter]

  # Generates and stores a new authentication token for the user.
  def generate_authentication_token!
    update_attribute(:authentication_token, Devise.friendly_token)
  end

  def self.token_cached(token)
    return unless token

    User.find_by_authentication_token(token)
  end

end