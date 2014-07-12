require "#{Rails.root}/lib/kayak_module"

class Trip < ActiveRecord::Base
  belongs_to :raver
  belongs_to :festival

  def self.flight(url)
    Kayak.parse(url)
    # raw       = HTTParty.get(url)
    # flights   = raw.scan(/[A-Z]{3}\s\d+:\d{2}[ap]\s[A-Z]{3}\s\d:\d{2}[ap]/)
    # prices_html = raw.scan(/bookitprice.++/)
    # prices    = prices_html.map do |html|
    #   html.scan(/\$.{3}/)[0]
    # end
    # durations_html = raw.scan(/class="duration">\s+.+/)
    # durations = durations_html.map do |html|
    #   html.scan(/\d.?h\s\d{2}m/)[0]
    # end
    # airlines  = raw.scan(/dealsinresult.++/)
    # links     = raw.scan(/"\/book\/flight\?.+/)
    # results   = []
    # (0..10).each do |i|
    #   results.push({
    #     airline:   airlines[i].split(' ').last,
    #     leg1:      flights[2*i],
    #     duration1: durations[2*i],
    #     leg2:      flights[2*i+1],
    #     duration2: durations[2*i+1],
    #     price:     prices[i],
    #     link:      'http://kayak.com' + links[i]
    #   })
    # end
    # return results
  end
end
