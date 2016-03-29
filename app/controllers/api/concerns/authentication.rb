module Authentication
  extend ActiveSupport::Concern

  included do
    before_filter :require_authentication
  end

  def require_authentication
    unless @user
      result = { messages: [I18n.t('session.invalid_token')] }

      render json: result, status: 401
    end
  end

end