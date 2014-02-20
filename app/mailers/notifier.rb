class Notifier < ActionMailer::Base
  def send_mail(email, first_name, last_name, team)
  	@team = team
  	@first_name = first_name
  	@last_name = last_name
    mail :subject => "Thank you for Registering.",
         :to      => email,
         :from    => "\"Bin of Parts\" <no-reply@binofparts.com>"
  end
end