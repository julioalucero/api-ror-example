module Api
  class BaseController < ApplicationController

    include Authentication
    include Responses
    include BusinessConcern

    skip_before_action :verify_authenticity_token

    respond_to :json

  end
end