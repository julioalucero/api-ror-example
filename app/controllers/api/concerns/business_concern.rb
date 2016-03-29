module BusinessConcern
  extend ActiveSupport::Concern

  def users_business
    @users_business ||= Business::Users.new
  end

end
