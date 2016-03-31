module Helpers
  module Session

    def authenticate_user(user)
      @current_user = user

      if request
        request.headers['X-AUTH-TOKEN'] = user.try(:authentication_token)
      end
    end

    def current_user
      @current_user
    end

  end
end
