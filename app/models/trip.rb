class Trip < ActiveRecord::Base
  belongs_to :raver
  belongs_to :festival
  has_many :flights

  serialize :lineup, Array

  def self.find_or_create(params)
    festival_id = params[:trip][:festival_id]
    raver_id    = params[:raver_id]

    trip = Trip.where(raver_id: raver_id, festival_id: festival_id).first

    if !trip
      festival = Festival.find(festival_id)

      trip = Trip.create(
        raver_id: raver_id,
        festival_id: festival_id,
        to_airport: festival.location,
        start_date: festival.start_date - 1,
        end_date: festival.end_date + 1,
      )
    end

    trip
  end

  def get_lineup
    self.lineup.map do |artist_id|
      Artist.find(artist_id)
    end.compact
  end

end
