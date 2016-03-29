class BaseSerializer < ActiveModel::Serializer

  def method_missing(method_sym, *arguments, &block)
    if scope.respond_to?(method_sym)
      scope.send(method_sym, *arguments, &block)
    else
      super
    end
  end

end