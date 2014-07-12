class Trip < ActiveRecord::Base
  belongs_to :raver
  belongs_to :festival

  def self.flight(location1, location2, date1, date2)
    base_url = "http://www.kayak.com/s/search/air?"
    query    = "l1=#{ location1 }&l2=#{ location2 } df=mdy&d1=#{ date1 }&d2=#{ date2 }&ns=y"
  end

  def self.hotel
  end
end
