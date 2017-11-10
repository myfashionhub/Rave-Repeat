Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,
    ENV['RR_TWITTER_KEY'], ENV['RR_TWITTER_SECRET']
  provider :facebook,
    ENV['RR_FACEBOOK_ID'], ENV['RR_FACEBOOK_SECRET'],
    callback_url: "#{ENV['RR_HOST']}/auth/facebook/callback"
end

