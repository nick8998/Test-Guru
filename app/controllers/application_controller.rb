class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.is_a?(Admin)
      flash[:notice] = "Hello, #{current_user.first_name}"
      admin_tests_path
    else
      flash[:notice] = "Hello, #{current_user.first_name}"
      root_path
    end
  end
 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname, :email, :password, :password_confirmation])
  end

end
