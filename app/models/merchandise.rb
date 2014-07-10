class Merchandise < ActiveRecord::Base
  has_and_belongs_to_many :ravers

  validates :url, uniqueness: true
end
