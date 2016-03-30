unless defined?(GOOGLE_CONFIG)
  GOOGLE_CONFIG = Yew.load('config/omniauth.yml')[Rails.env]['google']
end