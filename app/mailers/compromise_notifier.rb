class CompromiseNotifier < ActionMailer::Base
  default from: "\"GaragePlay Staff\" <staff@garageplay.com>" #"staff@garageplay.com"

  def send_compromise(compromise)
  	@compromise = compromise
  	mail(:to => ["raphaklaus@gmail.com", "juliochinemann17@gmail.com"], :subject => "Um compromisso se aproxima!")
  end
end
