require 'csv'

CSV.foreach("#{Rails.root}/db/festivals.csv") do |row|
  existing_festival = Festival.find_by(playlist: row[4])
  existing_festival.update(
    name: row[0],
    location: row[1],
    start_date: row[2],
    end_date: row[3],
    playlist: row[4],
    playlist_scid: row[5],
    status: row[6],
    lineup: row[7].split(',')
  )

  Festival.find_or_create_by(
    name: row[0],
    location: row[1],
    start_date: row[2],
    end_date: row[3],
    playlist: row[4],
    playlist_scid: row[5],
    status: row[6],
    lineup: row[7].split(',')
  )

end

# Initial heroku db seed
# names = ['ploxiln', 'Paul H1am', 'Daul Be', 'Nathan Lee', 'Jason_on_the_block', 'Clara T', 'Kaylee182', 'EDM Sauce', 'Becky', 'Skrillex4life', 'Il0veCalvinHarris', 'born2rave', 'Bass_drop002', 'Trance_or_die', 'haveuseenmolly']

# ravers = []
# names.each do |name|
#   ravers.push(Raver.create(name: name))
# end

# ravers.each do |raver|
#   rand = (6..10).to_a.sample
#   Trip.create(raver_id: raver.id, festival_id: rand)
# end
