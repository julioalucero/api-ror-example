module Helpers
  module Responses

    def match_json(klass_name, representation, *args)
      pattern = json_expression(klass_name, representation, *args)
      match_json_expression(pattern)
    end

    def json_expression(klass_name, representation, *args)
      klass = "JsonExpression::#{klass_name.to_s.pluralize.camelcase}".constantize

      user = if respond_to?(:current_user)
               current_user
             end

      klass.new(user).send(representation, *args)
    end

  end
end