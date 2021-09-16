class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後の遷移先
  def after_sign_in_path_for(resource)
    public_root_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:password_confirmation])
  end
end

