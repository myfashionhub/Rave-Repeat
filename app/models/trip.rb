class Trip < ActiveRecord::Base
  belongs_to :raver
  belongs_to :festival
  has_many :flights

  serialize :lineup, Array
end
