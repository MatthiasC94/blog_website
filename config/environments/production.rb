Rails.application.configure do
  config.cache_classes = true
  config.serve_static_assets = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = true
  config. assets.digest = true
  config.log_level = :debug
  config.log_tags = [ :request_id ]
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false

config.paperclip_defaults = {
  storage: :s3,
  s3_credentials: {
    bucket: ENV.fetch('AWS_BUCKET'),
    access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
  }
}

 config.action_mailer.default_url_options = { host: 'https://shrouded-castle-33621.herokuapp.com/' }
 config.action_mailer.delivery_method = :smtp

 ActionMailer::Base.smtp_settings = {
   :address        => 'smtp.sendgrid.net',
   :port           => '587',
   :authentication => :plain,
   :user_name      => ENV['SENDGRID_USERNAME'],
   :password       => ENV['SENDGRID_PASSWORD'],
   :domain         => 'heroku.com',
   :enable_starttls_auto => true
 }
 
end
