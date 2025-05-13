require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Code is not reloaded between requests.
  config.enable_reloading = false

  # Eager load code on boot.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Ne pas utiliser SassC : important pour éviter l'erreur
  config.assets.css_compressor = nil

  # Ne compile pas avec le pipeline si un asset est manquant (on compile tout avec npm build)
  config.assets.compile = true

  # Serveur de fichiers statiques désactivé (on laisse nginx/heroku s'en charger)
  # config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # Active Storage
  config.active_storage.service = :local

  # SSL
  config.force_ssl = true

  # Logging
  config.logger = ActiveSupport::Logger.new(STDOUT)
    .tap  { |logger| logger.formatter = ::Logger::Formatter.new }
    .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  config.log_tags = [ :request_id ]
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # Caching
  # config.cache_store = :mem_cache_store

  # ActionMailer
  config.action_mailer.perform_caching = false
  config.action_mailer.default_url_options = { host: "frederiquegranjon.com", protocol: "https" }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              "smtp.gmail.com",
    port:                 587,
    domain:               "gmail.com",
    user_name:            ENV["GMAIL_USERNAME"],
    password:             ENV["GMAIL_PASSWORD"],
    authentication:       "plain",
    enable_starttls_auto: true
  }

  # I18n
  config.i18n.fallbacks = true

  # ActiveRecord
  config.active_record.dump_schema_after_migration = false
  config.active_record.attributes_for_inspect = [ :id ]

  # Sécurité
  # config.hosts = ["example.com", /.*\.example\.com/]
  # config.host_authorization = { exclude: ->(request) { request.path == "/up" } }

  # Autres
  config.active_support.report_deprecations = false
  config.hosts << /.*\.herokuapp\.com/
  config.hosts << "frederiquegranjon.com"
  config.hosts << "www.frederiquegranjon.com"


  config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
  r301 %r{.*}, 'https://frederiquegranjon.com$&', if: Proc.new { |rack_env|
    rack_env['HTTP_HOST'] == 'www.frederiquegranjon.com'
  }
  end

end
