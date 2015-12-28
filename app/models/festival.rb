class Festival < ActiveRecord::Base
  has_many :trips
  has_many :ravers,  through: :trips
  has_many :artists, through: :appearances

  validates :name, presence: true,
                   uniqueness: { scope: :start_date }
end
