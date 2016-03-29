module JsonExpression
  class Base
    include Helpers::Responses

    attr_reader :current_user

    def initialize(current_user)
      @current_user = current_user
    end

  end
end