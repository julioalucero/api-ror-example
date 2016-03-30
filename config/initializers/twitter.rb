unless defined?(TWITTER_CONFIG)
  TWITTER_CONFIG = Yew.load('config/omniauth.yml')[Rails.env]['twitter']
end