require "#{Rails.root}/lib/kayak_module"

class Trip < ActiveRecord::Base
  belongs_to :raver
  belongs_to :festival

  def self.flight(url)
    Kayak.parse(url)
  end
end
