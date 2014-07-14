class PlaylistId < ActiveRecord::Migration
  def up
    add_column :festivals, :playlist_scid, :string
  end

  def down
    add_column :festivals, :playlist_scid
  end
end
