require_relative 'base'

module JsonExpression
  class Users < Base

    def user(user)
      {
        id:                   user.id,
        email:                user.email,
        theme:                user.theme,
        notification:         user.notification,
        authentication_token: user.authentication_token
      }
    end

  end
end
