require 'csv'

CSV.foreach("#{Rails.root}/db/festivals.csv") do |row|
  Festival.create(name: row[0], location: row[1], start_date: row[2], end_date: row[3], playlist: row[4], playlist_scid: row[5], status: row[6], lineup: row[7].split(','))
end
