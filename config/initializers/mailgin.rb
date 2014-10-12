Mailgun.configure do |config|
  config.api_key = Settings.mailgun.api_key
  config.domain  = Settings.mailgun.api_host
end