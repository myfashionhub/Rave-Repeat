class Raver < ActiveRecord::Base
  has_many :trips
  has_many :festivals, through: :trips
  has_and_belongs_to_many :merchandises

  serialize :lineup, Array

  def self.twitter_omniauth(data)
    @user = Raver.find_by(name: data.info.nickname) || create_with_omniauth(data)
  end

  def self.create_with_twitter(data)
    @user = Raver.create({
      name: data.info.nickname,
      image: data.info.image,
      twitter_token: data.extra.access_token.params[:oauth_token],
      twitter_token_secret: data.extra.access_token.params[:oauth_token_secret]
      })
  end

  def self.facebook_omniauth(data)
    @user = Raver.find_by(facebook_uid: data.uid) || create_with_omniauth(data)
  end

  def self.create_with_facebook(data)
    @user = Raver.create({
      name: data.info.name,
      image:  data.info.image,
      facebook_token: data.credentials.token,
      facebook_uid: data.uid
      })
  end

end
