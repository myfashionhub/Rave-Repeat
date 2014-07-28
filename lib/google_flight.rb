require 'google/api_client'

class GoogleFlight

  def search(travelers, origin, destination, date1, date2)
    client = Google::APIClient.new(
      application_name: 'Rave Repeat',
      application_version: '1.0.0',
    )
    qpx_express = client.discovered_api('qpxExpress', 'v1')

    google_key = ENV['RR_GOOGLE_KEY']
    base_uri   = "https://www.googleapis.com/qpxExpress/v1/trips/search?key=#{google_key}"


    passengers = {
      "adultCount" => travelers
    },
    slice      = [
      {
        "origin" => "#{origin}",
        "destination" => "#{destination}",
        "date" => "#{date1}",
        "maxStops" => 0
      },
      {
        "origin" => "#{destination}",
        "destination" => "#{origin}",
        "date" => "#{date2}",
        "maxStops" => 0,
      }
    ]
     count = { 'solutions' => 10 }

    result = qpx_express.trips.search
    result.to_s
  end

end

flightapi = GoogleFlight.new
puts flightapi.search(2, 'lga', 'atl', '2014-08-05', '2014-08-09')
