class VisitorsController < ApplicationController

  def index
  	
  end

  def send_mail
    email = params[:send_mail][:email].downcase
    first_name = params[:send_mail][:first_name]
    last_name = params[:send_mail][:last_name]
    team = params[:send_mail][:team]
    post_exists = MailingList.where(email: email).exists?
    if post_exists == true
      flash[:error] = "The email #{email} has already registered."
      redirect_to root_path
    else
      MailingList.create(:email => email, :first_name => first_name, :last_name => last_name, :team => team)
    	Notifier.send_mail(email, first_name, last_name, team).deliver
      flash[:notice] = "Thank you for registering. When the beta is ready an email will be sent to #{email}."
    	redirect_to root_path
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def mail_params
      params.require(:send_mail).permit(:email, :first_name, :last_name, :team)
    end

end
