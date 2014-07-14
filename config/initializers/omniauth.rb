Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['GR_TWITTER_KEY'], ENV['GR_TWITTER_SECRET']
  provider :facebook, ENV['GR_FACEBOOK_ID'], ENV['GR_FACEBOOK_SECRET']
end

