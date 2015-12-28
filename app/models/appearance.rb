class Appearance < ActiveRecord::Base
  belongs_to :artist
  belongs_to :festival

  validates :artist_id, uniqueness: { scope: :festival_id }
end
