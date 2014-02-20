class VisitorsController < ApplicationController

  def index
  	
  end

  def send_mail
  	email = params[:send_mail][:email]
  	first_name = params[:send_mail][:first_name]
  	last_name = params[:send_mail][:last_name]
  	team = params[:send_mail][:team]
  	Notifier.send_mail(email, first_name, last_name, team).deliver
  	flash[:notice] = "Thank you for registering. When the beta is ready an email will be sent to #{email}."
  	redirect_to root_path
  end

end
