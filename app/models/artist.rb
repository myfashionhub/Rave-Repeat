class Artist < ActiveRecord::Base
  has_many :appearances
  has_many :festivals, through: :appearances

  validates :name, presence: true, uniqueness: true

  def self.find_or_create_by_name(name)
    artist = Artist.where('name iLIKE ?', name).first
    if artist.blank?
      artist = Artist.create(name: name)
    end

    artist
  end
end
