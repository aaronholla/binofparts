class API::V1::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
   # This is our new function that comes before Devise's one
  before_filter :authenticate_user_from_token!
  # This is Devise's authentication
  before_filter :authenticate_user!
 
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
	  # Only add some parameters
	  devise_parameter_sanitizer.for(:accept_invitation).concat [:first_name, :last_name]
	  devise_parameter_sanitizer.for(:invite).concat [:team_number_id]
	end
	
	private
  
  	def authenticate_user_from_token!
	   user_email = params[:user_email].presence
	   user       = user_email && User.find_by_email(user_email)
	 
	   # Notice how we use Devise.secure_compare to compare the token
	   # in the database with the token given in the params, mitigating
	   # timing attacks.
	   if user && Devise.secure_compare(user.authentication_token, params[:user_token])
	   	sign_in user, store: false
	   end
	end
end
