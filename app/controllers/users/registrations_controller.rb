class Users::RegistrationsController < Devise::RegistrationsController
  before_action :allow_params, only: [:create, :update]

  protected

  def after_sign_up_path_for(_)
    '/'
  end

  def allow_params
    devise_parameter_sanitizer.for(:sign_up) << :real_name
    devise_parameter_sanitizer.for(:account_update) << :real_name
  end
end
