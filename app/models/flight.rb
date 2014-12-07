require "#{Rails.root}/lib/kayak_module"

class Flight < ActiveRecord::Base
  belongs_to :trip

  def self.search(url)
    flights = Kayak.parse(url)
    flights.map do |flight|
      { airline: flight[:airline],
        price: flight[:price],
        link: flight[:link],
        leg1: "#{flight[:leg1_airport1]} #{flight[:leg1_time1]} =>  #{flight[:leg1_airport2]} #{flight[:leg1_time2]}",
        leg2: "#{flight[:leg2_airport1]} #{flight[:leg2_time1]} =>  #{flight[:leg2_airport2]} #{flight[:leg2_time2]}"
      }
    end
  end

end
