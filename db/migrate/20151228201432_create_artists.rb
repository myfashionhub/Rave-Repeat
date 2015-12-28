class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :image
      t.string :website
      t.string :description
      t.text   :biography
      t.timestamps
    end

    create_table :appearances do |t|
      t.integer    :artist_id
      t.integer    :festival_id
      t.timestamps
    end

    add_column :festivals, :ticket_link, :string
    add_column :festivals, :prices, :text
    rename_column :festivals, :playlist_scid, :image
  end
end
