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
      t.string :date
      t.string :lineup
      t.string :playlist
      t.timestamps
    end

    create_table :trips do |t|
      t.string :name
      t.string :location
      t.string :date
      t.string :lineup
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
  end

  def down
    drop_table :ravers
    drop_table :festivals
    drop_table :trips
    drop_table :merchandises
  end
end
