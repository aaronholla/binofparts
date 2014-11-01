class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :expire_hsts

  around_filter :append_event_tracking_tags
  
  def mixpanel_distinct_id
  	if user_signed_in?
  		current_user.id
  	end
  end
  def mixpanel_name_tag
    current_user && current_user.email
  end
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
	  # Only add some parameters
	  devise_parameter_sanitizer.for(:accept_invitation).concat [:first_name, :last_name]
	  devise_parameter_sanitizer.for(:invite).concat [:team_number_id, :admin]
	  devise_parameter_sanitizer.for(:account_update) do |u|
	    u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
	  end
	end

  private

  def expire_hsts
    response.headers["Strict-Transport-Security"] = 'max-age=0'
  end
end
