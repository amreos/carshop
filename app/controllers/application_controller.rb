#app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		#added these 2 below lines, any erros I should comment this out
	  added_attrs = [:email, :password, :password_confirmation, :remember_me, :avatar, :avatar, :avatar_cache]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs

     #devise_parameter_sanitizer.for(:sign_up)  { |u| u.permit(  :email,:password, :password_confirmation , roles: [] ) }
     devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :remember_me, :last_name, :first_name, :birthday,])
     devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
     devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :email, :birthday, :about, :password, :current_password])
end
end
