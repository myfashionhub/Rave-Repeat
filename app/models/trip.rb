class Trip < ActiveRecord::Base
  belongs_to :raver
  belongs_to :festival
end
