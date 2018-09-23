class ApplicationController < ActionController::Base
  before_action :configure_user_permitted_params, if: :devise_controller?

  protect_from_forgery with: :exception
  helper ApplicationHelper

  protected

  def configure_user_permitted_params
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit( :name, :last_name, :email, :password, :password_confirmation, :role)
    end
  end
end
