Rails.application.config.middleware.use OmniAuth::Builder do
  configure do |config|
    config.path_prefix = '/auth'
  end
  provider :developer unless Rails.env.production?
  provider :mendeley, ENV['MENDELEY_KEY'], ENV['MENDELEY_SECRET']
end

