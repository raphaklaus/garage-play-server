class CompromiseNotifier < ActionMailer::Base
  default from: "\"GaragePlay Staff\" <staff@garageplay.com>" #"staff@garageplay.com"

  def send_email_compromise(notification)
  	notification.datehour = notification.datehour.strftime("%d/%m/%Y às %H:%M")
  	@compromise = notification
    # @users_emails = User.all.pluck(:email)
    @band = Band.includes(:users).where("id" => @compromise.band_id)
    @band_name = @band[0].name
    @users_emails = @band[0].users.pluck(:email)    
    puts @users_emails.join(',')
  	mail(:to => @users_emails, :subject => "Um compromisso se aproxima!")
  end
end
