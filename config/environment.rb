# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SampleApp::Application.initialize!

# PRH added lines below on 101211 to try and get email flowing
  require 'tlsmail'
  Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.perform_deliveries = true
#  ActionMailer::Base.default_charset = "utf-8"
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "SirShagdaddy@gmail.com",
  :password             => "2goo4uXX",
  :authentication       => "plain",
  :tls                  => true,
  :enable_starttls_auto => true
}

# ActionMailer::Base.default_url_options[:host] = "localhost:3000"

