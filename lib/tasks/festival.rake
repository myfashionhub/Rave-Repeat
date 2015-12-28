require 'csv'

namespace :festival do

  task :populate, [:year] => :environment do |task, args|
    filename = "#{Rails.root}/db/festivals-#{args[:year]}.csv"
    CSV.foreach(filename) do |row|
      festival = Festival.find_or_create_by(
        name: row[0],
        start_date: row[2]
      )

      festival.update(
        name: row[0],
        location: row[1],
        start_date: row[2],
        end_date: row[3],
        playlist: row[4],
        playlist_scid: row[5],
        status: row[6]
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

  task :convert_artists => :environment do |task|
    Festival.all.each do |festival|
      festival.lineup.split("\n- ").each do |artist_name|
        artist = Artist.find_or_create_by_name(artist_name)

        if artist.id.present?
          Appearance.create(
            artist_id: artist.id,
            festival_id: festival.id
          )
        end
      end
    end
  end

end
