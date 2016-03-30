module Business
  class Sessions

    # Creates a new session for the given email and password.
    #
    # @param [String] email The email to use in the authentication
    # @param [String] password The password to use in the authentication
    # @param [String] provider The provider service
    #
    # @return [User]
    def create(email, password, provider = nil)
      session = CustomSession.new({ email: email, password: password, provider: provider })

      if session.valid?
        session.user.generate_authentication_token!
      end

      session
    end

  end
end