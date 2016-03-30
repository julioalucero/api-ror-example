module BusinessConcern
  extend ActiveSupport::Concern

  def users_business
    @users_business ||= Business::Users.new
  end

  def sessions_business
    @sessions_business ||= Business::Sessions.new
  end

end
