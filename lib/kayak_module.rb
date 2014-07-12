class Kayak
  def self.parse(url)
    doc       = Nokogiri::HTML(HTTParty.get(url))
    airlines  = doc.css('.airlineName')
    airports  = doc.css('.airport')
    times     = doc.css('.flighttime')
    prices    = doc.css('.pricerange')
    links     = doc.css('.bookitselect.buylink')
    durations = doc.css('.legholder').css('.duration')
    flights   = []
    (0..10).each do |i|
      flights.push({ airline: airlines[i].children[0].text.strip,
        leg1_airport1: airports[4*i].attributes['title'].value.split(' ').last,
        leg1_time1: times[4*i].children[0].text.strip,
        leg1_airport2: airports[4*i+1].attributes['title'].value.split(' ').last,
        leg1_time2: times[4*i+1].children[0].text.strip,
        leg1_duration: durations[2*i].children.text.strip,

        leg2_airport1: airports[4*i+2].attributes['title'].value.split(' ').last,
        leg2_time1: times[4*i+2].children[0].text.strip,
        leg2_airport2: airports[4*i+3].attributes['title'].value.split(' ').last,
        leg2_time2: times[4*i+3].children[0].text.strip,
        leg2_duration: durations[2*i+1].children.text.strip,

        price: prices[i].children[1].children.text,
        link: 'http://kayak.com' + links[i].children[1].attributes['href'].value
      })
    end

    flights.keep_if { |flight| flight[:link].length > 60 }
    return flights
  end
end

# Kayak.query("NYC", "Atlanta,GA", "08/28/2014", "09/01/2014")
# Kayak.parse('http://www.kayak.com/s/search/air?l1=Washington,DC&l2=New%20York,%20NY&df=mdy&d1=08%2F28%2F2014&d2=09%2F01%2F2014&ns=y')

#http://www.kayak.com/s/search/air?l1=Washington,DC&l2=New%20York,%20NY&df=mdy&d1=08%2F28%2F2014&d2=09%2F01%2F2014&ns=y

# Regex
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
