require_relative 'base'

module JsonExpression
  class Users < Base

    def user(user)
      {
        id:           user.id,
        email:        user.email,
        theme:        user.theme,
        notification: user.notification
      }
    end

  end
end
