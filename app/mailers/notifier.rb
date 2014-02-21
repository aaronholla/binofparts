class Notifier < ActionMailer::Base
  def send_mail(email, first_name, last_name, team)
  	attachments.inline['logo.png'] = File.read(Rails.root.join("app/assets/images/","bop-logo-full-black.png"))
  	@team = team
  	@first_name = first_name
  	@last_name = last_name
    mail :subject => "Thank you for Registering.",
         :to      => email,
         :from    => "\"Bin of Parts\" <no-reply@binofparts.com>"
  end
end