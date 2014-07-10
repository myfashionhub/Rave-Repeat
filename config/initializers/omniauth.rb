Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :twitter, ENV['GR_TWITTER_KEY'], ENV['GR_TWITTER_SECRET']
  provider :twitter, "VHpPv1dqg58PgESzoT8vp23kI", "ZqZChoG1w2dp6qqik861MMxKwLaB6y7BiDU8WUb6j6QaJ6Hugl"
  #provider :facebook, ENV['GR_FACEBOOK_ID'], ENV['GR_FACEBOOK_SECRET']
  provider :facebook, "543529169080712", "68ccf7693f5fffb3e1f0bd6d2a4bc49c"

end

