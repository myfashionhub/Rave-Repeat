class Kayak
  def self.parse(url)
    doc       = Nokogiri::HTML(HTTParty.get(url))
    airlines  = doc.css('.airlineName')
    airports  = doc.css('.airport')
    times     = doc.css('.flighttime')
    prices    = doc.css('.pricerange')
    links     = doc.css('.bookitselect.buylink')
    flights   = []
    (0..10).each do |i|
      flights.push({ airline: airlines[i].children[0].text.strip,
        leg1_dep: airports[4*i].attributes['title'].value,
        leg1_arrival: airports[4*i+1].attributes['title'].value,
        leg2_dep: airports[4*i+2].attributes['title'].value,
        leg2_arrival: airports[4*i+3].attributes['title'].value,
        #match: airports[4*i].children[1].attributes['class'].value,
        leg1_dep_time: times[4*i].children[0].text.strip,
        leg1_arrival_time: times[4*i+1].children[0].text.strip,
        leg2_dep_time: times[4*i+2].children[0].text.strip,
        leg2_arrival_time: times[4*i+3].children[0].text.strip,
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


