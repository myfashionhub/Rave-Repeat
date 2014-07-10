class Festival < ActiveRecord::Base
  has_many :trips
  has_many :ravers, through: :trips

  serialize :lineup, Array
end
