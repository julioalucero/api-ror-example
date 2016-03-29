# @attr [integer] id
# @attr [string] email
# @attr [string] theme
# @attr [boolean] notification
class UserSerializer < BaseSerializer

  attributes :id, :email, :theme, :notification

end
