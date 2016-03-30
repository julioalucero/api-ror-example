# @attr [integer] id
# @attr [string] email
# @attr [string] theme
# @attr [boolean] notification
class UserSerializer < BaseSerializer

  attributes :id
  attributes :email
  attributes :theme
  attributes :notification
  attributes :authentication_token

end
