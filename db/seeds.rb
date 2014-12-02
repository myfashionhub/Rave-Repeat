require 'csv'

CSV.foreach("#{Rails.root}/db/festivals.csv") do |row|
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

  existing_festival = Festival.find_by(playlist: row[4])
  unless existing_festival.nil?
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
  end
end

# Initial user db seed
names = ['ploxiln', 'Paul H1am', 'Daul Be', 'Nathan Lee',
'Jason_on_the_block', 'Clara T', 'Kaylee182', 'EDM Sauce',
'Becky', 'Skrillex4life', 'Il0veCalvinHarris', 'born2rave',
'Bass_drop002', 'Trance_or_die', 'haveuseenmolly']

names.each do |name|
  Raver.create(name: name)
end

Raver.all.each do |raver|
  festival1 = Festival.all.sample
  festival2 = Festival.all.sample
  Trip.create(raver_id: raver.id, festival_id: festival1.id,
    start_date: festival1.start_date - 1, end_date: festival1.end_date + 1)
  Trip.create(raver_id: raver.id, festival_id: festival2.id,
    start_date: festival2.start_date - 1, end_date: festival2.end_date + 1)
end
