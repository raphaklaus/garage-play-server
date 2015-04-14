# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'staff@garageplay.net',
  :password => Rails.application.secrets.email_password,
  :domain => 'garageplay.net',
  :address => 'rakontome.domain.com',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => false
}