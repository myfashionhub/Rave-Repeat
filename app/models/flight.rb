require "#{Rails.root}/lib/kayak_module"

class Flight < ActiveRecord::Base
  belongs_to :trip

  def self.search(url)
    Kayak.parse(url)
  end

end
