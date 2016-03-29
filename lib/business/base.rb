module Business
  class Base

    def permit_attrs(attrs, permitted_attrs, &block)
      attrs = ActionController::Parameters.new(attrs)

      yield(attrs) if block_given?

      attrs.permit(permitted_attrs)
    end

  end
end