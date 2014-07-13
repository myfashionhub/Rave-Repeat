class CreateTables < ActiveRecord::Migration
  def up
    create_table :ravers do |t|
      t.string :name
      t.string :image
      t.string :twitter_token
      t.string :twitter_token_secret
      t.string :facebook_uid
      t.string :facebook_token
      t.string :location
      t.string :lineup
      t.timestamps
    end

    create_table :festivals do |t|
      t.string :name
      t.string :location
      t.date :start_date
      t.date :end_date
      t.text   :lineup
      t.string :playlist
      t.string :status
      t.timestamps
    end

    create_table :trips do |t|
      t.string :date
      t.string :lineup
      t.string :start_date
      t.string :end_date
      t.string :from_airport
      t.string :to_airport
      t.references :raver
      t.references :festival
      t.timestamps
    end

    create_table :merchandises do |t|
      t.string :name
      t.string :category
      t.string :gender
      t.string :price
      t.string :image
      t.string :url
      t.string :seller
      t.timestamps
    end

    create_table :merchandises_ravers, :id => false do |t|
      t.integer :merchandise_id
      t.integer :raver_id
    end

    create_table :flights do |t|
      t.string :airline
      t.string :leg1
      t.string :leg2
      t.string :price
      t.string :link
      t.integer :trip_id
      t.timestamps
    end
  end

  def down
    drop_table :ravers
    drop_table :festivals
    drop_table :trips
    drop_table :merchandises
    drop_table :flights
  end
end
