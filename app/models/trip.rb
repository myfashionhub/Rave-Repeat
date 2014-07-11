require "#{Rails.root}/lib/kayak_module.rb"

class Trip < ActiveRecord::Base
  belongs_to :raver
  belongs_to :festival

  def self.flight
    Kayak.query(location1, location2, date1, date2)
    Kayak.parse
  end
end
