class Festival < ActiveRecord::Base
  has_many :trips
  has_many :ravers,  through: :trips
  has_many :artists, through: :appearances

  validates :name, presence: true,
                   uniqueness: { scope: :start_date }

  def get_lineup
    Appearance.where(festival_id: self.id).map do |appearance|
      Artist.find(appearance.artist_id)
    end.compact
  end
end
