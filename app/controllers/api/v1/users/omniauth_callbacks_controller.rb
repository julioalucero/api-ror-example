# @tag Users
class Api::V1::Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  skip_before_filter :require_authentication, only: [:create]

  # Register user from google oauth2 if it does not exists and create session
  #
  # @response_class UserSerializer
  def google_oauth2
    @current_user = users_business.create_from_google_oauth2(request.env["omniauth.auth"].info)

    if @current_user.errors.any?
      models_validation_errors_response(@current_user)
    else
      sessions_business.create(@current_user.email, @current_user.password,
                               provider: Enums::Providers::TWITTER)
      render json: @current_user, serializer: UserSerializer, root: false
    end
  end

  def twitter
  end

  private

  def users_business
    @users_business ||= Business::Users.new
  end

  def sessions_business
    @sessions_business ||= Business::Sessions.new
  end

end
