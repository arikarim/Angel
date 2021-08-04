# frozen_string_literal: true

class ApplicationController < ActionController::API
  respond_to :json

     before_action :configure_permitted_parameters, if: :devise_controller?

     protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :bio, :about, :available, :password, :image,:password_confirmation)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :bio, :about, :available, :image, :password, :current_password,:password_confirmation)}
  end
end
