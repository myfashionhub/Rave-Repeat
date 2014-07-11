require 'nokogiri'
require 'httparty'

class Kayak
  include HTTParty
  maintain_method_across_redirects true

  def self.query(location1, location2, date1, date2)
    url   = "http://www.kayak.com/s/search/air?"
    query = "l1=#{ location1 }&l2= #{ location2 } df=ymd&d1=#{ date1 }&d2=#{ date2 }&ns=y"
    return url + query
  end

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
# http://www.kayak.com/s/search/air?l1=Washington,DC&l2=New%20York,%20NY&df=ymd&d1=2014%2F08%2F28&d2=2014%2F09%2F01&ns=y
    end
    flights.keep_if { |flight| flight[:link].length > 60 }
    #puts flights
    puts url
  end
end


Kayak.parse('http://www.kayak.com/s/search/air?l1=Washington,DC&l2=New%20York,%20NY&df=ymd&d1=2014%2F08%2F28&d2=2014%2F09%2F01&ns=y')
