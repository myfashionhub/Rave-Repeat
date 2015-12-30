class Raver < ActiveRecord::Base
  has_many :trips
  has_many :festivals, through: :trips
  has_and_belongs_to_many :merchandises

  include ApplicationHelper

  def self.twitter_omniauth(data)
    @user = Raver.find_by(name: data.info.nickname) || create_with_twitter(data)
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
    @user = Raver.find_by(facebook_uid: data.uid) || create_with_facebook(data)
  end

  def self.create_with_facebook(data)
    @user = Raver.create({
      name: data.info.name,
      image:  data.info.image,
      facebook_token: data.credentials.token,
      facebook_uid: data.uid
      })
  end

  def self.trips(params)
    if params[:past]
      trips = Trip.where(raver_id: params[:raver_id])
                .where('start_date < ?', Date.today)
    elsif params[:upcoming]
      trips = Trip.where(raver_id: params[:raver_id])
                .where('start_date >= ?', Date.today)
    end

    trips.map do |trip|
      festival = Festival.find(trip.festival_id)
      artists = trip.lineup.map do |artist_id|
        Artist.find(artist_id).name
      end.join(', ')

      { festival: festival.name,
        start_date: ApplicationHelper.display_date(trip.start_date),
        end_date: ApplicationHelper.display_date(trip.end_date),
        from_airport: trip.from_airport,
        to_airport: trip.to_airport,
        lineup: artists,
        trip_id: trip.id
      }
    end
  end

end
