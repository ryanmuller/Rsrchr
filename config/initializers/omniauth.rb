Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :mendeley, ENV['MENDELEY_KEY'], ENV['MENDELEY_SECRET']
end

