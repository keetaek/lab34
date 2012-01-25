Lab34::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true #NOTE: By Default DEV environment doesn't send email. This option forces to send email Keetaek
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address        =>  "smtp.gmail.com",
    :port           =>  587,
    :user_name      =>  'keetaek',
    :password       =>  'hong831004',
    :authentication =>  'plain',
    :enable_starttls_auto => true
  }

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  config.action_mailer.default_url_options = { :host => "localhost:3000" }  
  #ENV['PANDASTREAM_URL'] = "http://ksid490e-85eb-11df-b41e-12313b082ce2:8x7+v85WsWz1Jgqzlz5+g1zR9P2ex78wg1l61jag@api.pandastream.com:80/927a9d9xk37ded62422d4613229c156f"
  
end
