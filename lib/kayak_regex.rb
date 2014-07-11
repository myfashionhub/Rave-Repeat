    raw       = HTTParty.get(url)
    itinerary = raw.scan(/[A-Z]{3}\s\d:\d{2}[ap]\s[A-Z]{3}\s\d:\d{2}[ap]/)
    prices    = raw.scan(/bookitprice.++/)
    durations = raw.scan(/\d\d?h\s\d{2}m/)
    airlines  = raw.scan(/dealsinresult.++/)
# http://www.kayak.com/s/search/air?l1=Washington,DC&l2=New%20York,%20NY&df=ymd&d1=2014%2F08%2F28&d2=2014%2F09%2F01&ns=y
