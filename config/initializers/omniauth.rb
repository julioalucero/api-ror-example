Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, TWITTER_CONFIG['app_key'], TWITTER_CONFIG['app_secret']
  provider :google_oauth2, GOOGLE_CONFIG["google_client_id"], GOOGLE_CONFIG["google_client_secret"]
end