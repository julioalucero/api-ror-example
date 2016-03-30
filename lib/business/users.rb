module Business
  class Users < Business::Base

    PERMITTED_CREATE_ATTRS  = [:email, :password, :theme, :notification]

    # Creates a new user.
    #
    # If the given params are valid then the returned user is persisted
    # otherwise it is not.
    #
    # @param [Hash] attrs The attributes for new user
    #
    # @return [User]
    def create(attrs)
      User.create(permit_user_create_attrs(attrs))
    end

    # Creates a new user from google oauth2
    #
    # If the given params are valid then the returned user is persisted
    # otherwise it is not.
    #
    # @param [Hash] attrs The attributes for new user
    #
    # @return [User]
    def create_from_google_oauth2(attrs)
      user = User.where(:email => attrs["email"]).first

      unless user
        user = create(attrs.merge(theme: Enums::UserThemes::DEFAULT, notification: true,
                                  password: Devise.friendly_token[0,20]))
       end

      user
    end

    private

    def permit_user_create_attrs(attrs)
      permit_attrs(attrs, PERMITTED_CREATE_ATTRS)
    end

  end
end