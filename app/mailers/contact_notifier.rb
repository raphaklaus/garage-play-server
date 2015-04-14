class ContactNotifier < ActionMailer::Base
  default from: "\"GaragePlay Staff\" <staff@garageplay.com>" #"staff@garageplay.com"

  def send_contact_confirmation_email(contact)
  	@contact = contact
  	puts("######################")
  	puts(@contact.email)
  	mail(:to => @contact.email, :subject => "Obrigado por nos ajudar a melhorar!")
  end

  def send_contact_email(contact)
  	@contact = contact
  	mail(:to => "staff@garageplay.net", :subject => "Fale Conosco GaragePlay")
  end
end
