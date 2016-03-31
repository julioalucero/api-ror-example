module Authentication
  extend ActiveSupport::Concern

  included do
    before_filter :require_authentication
    helper_method :current_user
  end

  def current_user
    return @current_user if @current_user

    @current_user ||= User.token_cached(current_user_token)
  end

  def require_authentication
    unless current_user
      result = { messages: [I18n.t('session.invalid_token')] }

      render json: result, status: 401
    end
  end

  def set_current_user(user)
    @current_user = user
  end

  def current_user_token
    request.headers[Enums::HttpHeaders::AUTH_TOKEN]
  end

end