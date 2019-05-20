require 'csv'

namespace :festival do
  task :populate, [:year] => :environment do |task, args|
    filename = "#{Rails.root}/db/festivals.csv"
    CSV.foreach(filename) do |row|
      festival = Festival.find_or_create_by(
        name: row[0],
        start_date: row[2]
      )
      puts "Updating #{festival.name}"

      festival.update(
        location: row[1],
        end_date: row[3],
        playlist: row[4],
        image: row[5],
        status: row[6],
        ticket_link: row[8]
      )

      row[7].split(',').each do |artist_name|
        artist_name.strip!
        artist = Artist.find_or_create_by_name(artist_name)

        if artist.id.present?
          Appearance.find_or_create_by(
            artist_id: artist.id,
            festival_id: festival.id
          )
        end
      end
    end
  end
end
