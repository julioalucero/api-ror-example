# @tag UserSession
class Api::V1::SessionsController < Api::BaseController

  skip_before_filter :require_authentication, only: :create

  # Create user session
  #
  # @body_parameter [string] email
  # @body_parameter [string] password
  #
  # @response_class UserSerializer
  def create
    @session = sessions_business.create(params[:email], params[:password])

    if @session.errors.any?
      models_validation_errors_response(@session)
    else
      set_current_user(@session.user)
      render json: @session.user, serializer: UserSerializer, root: false
    end
  end

end