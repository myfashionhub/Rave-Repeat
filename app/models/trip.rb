class Trip < ActiveRecord::Base
  belongs_to :raver
  belongs_to :festival
  has_many :flights

  serialize :lineup, Array

  def self.create_new(params)
    festival_id = params[:trip][:festival_id]
    puts festival_id.inspect
    raver = Raver.find(params[:raver_id])
    trip_id = nil
    raver.trips.each do |trip|
      trip_id = trip.id if trip.festival_id.to_s == festival_id
    end

    if trip_id == nil
      festival = Festival.find(festival_id)
      trip     = Trip.create(raver_id: raver.id,
        festival_id: festival_id,
        to_airport: festival.location,
        start_date: festival.start_date - 1,
        end_date: festival.end_date + 1,
      )
      trip_id = trip.id
    end
    trip_id
  end

end
