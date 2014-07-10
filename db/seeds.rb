require 'csv'

CSV.foreach("#{Rails.root}/db/festivals.csv") do |row|
  Festival.create(name: row[0], location: row[1], date: row[2], playlist: row[3], lineup: row[5].split(','))
end
