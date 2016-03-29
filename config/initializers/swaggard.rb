Swaggard.configure do |config|
  config.api_version          = '0.1'
  config.api_formats          = [:json]
  config.authentication_type  = 'header'
  config.authentication_key   = 'X-AUTH-TOKEN'

  config.models_paths = %W[#{Rails.root}/app/serializers/**/*.rb
                           #{Rails.root}/app/sanitizers/**/*.rb]
end