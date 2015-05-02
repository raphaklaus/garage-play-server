class CompromiseNotifier < ActionMailer::Base
  default from: "\"GaragePlay Staff\" <staff@garageplay.com>" #"staff@garageplay.com"

  def send_compromise(notification)
  	@compromise = notification
    @users_emails = User.all.pluck(:email)
    puts @users_emails.join(',')
  	mail(:to => @users_emails, :subject => "Um compromisso se aproxima!")
  end
end
