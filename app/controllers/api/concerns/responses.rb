module Responses
  extend ActiveSupport::Concern

  def models_validation_errors_response(*models)
    result = {}

    result[:messages] = models.compact.inject([]) do |result, model|
      result.concat(model.errors.full_messages)
    end

    render json: result, status: :unprocessable_entity
  end

end