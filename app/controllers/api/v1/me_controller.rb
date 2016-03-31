# @tag CurrentUser
class Api::V1::MeController < Api::BaseController

  # Get the current user information
  #
  # @response_class UserSerializer
  def show
    @user = current_user

    render json: @user, serializer: UserSerializer, root: false
  end

  # Update current user
  #
  # @body_parameter [string] theme
  # @body_parameter [boolean] notification
  # @body_parameter [string] email
  # @body_parameter [string] password
  #
  # @response_class UserSerializer
  def update
    @user = current_user

    if users_business.update(@user, params)
      render json: @user, serializer: UserSerializer, root: false
    else
      models_validation_errors_response(@user)
    end
  end

end