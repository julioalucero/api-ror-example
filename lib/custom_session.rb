class CustomSession
  include ActiveModel::Model

  attr_accessor :email, :password, :provider

  attr_reader :user

  validate :email_present
  validate :password_present
  validate :user_exists
  validate :password_is_valid

  private

  def email_present
    add_error_to_base unless @email.present?
  end

  def password_present
    add_error_to_base unless @password.present? || @provider.present?
  end

  def user_exists
    return unless @email.present?

    @user = User.find_by_email(@email)

    add_error_to_base unless @user
  end

  def password_is_valid
    return if  @provider.present?
    return if !@user || @password.blank?

    add_error_to_base unless @user.valid_password?(@password)
  end


  def add_error_to_base
    return unless self.errors[:base].empty?

    self.errors.add(:base, I18n.t('session.email_password_incorrect'))
  end

end