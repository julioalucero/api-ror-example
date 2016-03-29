# @tag Users
class Api::V1::UsersController < Api::BaseController

  skip_before_filter :require_authentication, only: [:create]

  # Register user
  #
  # @body_parameter [string] email
  # @body_parameter [string] password
  # @body_parameter [string] theme
  # @body_parameter [boolean] notification
  #
  # @response_class UserSerializer
  def create
    @current_user = users_business.create(params.dup)

    if @current_user.errors.any?
      models_validation_errors_response(@current_user)
    else
      render json: @current_user, serializer: UserSerializer, root: false
    end
  end

end