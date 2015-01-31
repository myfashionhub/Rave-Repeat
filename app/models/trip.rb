class Trip < ActiveRecord::Base
  belongs_to :raver
  belongs_to :festival
  has_many :flights

  serialize :lineup, Array

  def self.create_new(params)
    festival_id = params[:trip][:festival_id]
    festival    = Festival.find(festival_id)
    Trip.create(raver_id: params[:raver_id],
      festival_id: festival_id,
      to_airport: festival.location,
      start_date: festival.start_date - 1,
      end_date: festival.end_date + 1,
    )
  end
end
