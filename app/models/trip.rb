require "#{Rails.root}/lib/kayak_module"

class Trip < ActiveRecord::Base
  belongs_to :raver
  belongs_to :festival
  has_many :flights

  def self.flight(url)
    Kayak.parse(url)
  end
end
