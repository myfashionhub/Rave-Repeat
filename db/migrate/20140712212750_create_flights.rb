class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :airline
      t.string :leg1_airport1
      t.time :leg1_time1
      t.string :leg1_airport2
      t.string :leg1_time2
      t.string :leg1_duration
      t.string :leg2_airport1
      t.time :leg2_time1
      t.string :leg2_airport2
      t.string :leg2_time2
      t.string :leg2_duration
      t.string :price
      t.text :link

      t.timestamps
    end
  end
end
