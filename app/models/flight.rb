class Flight < ActiveRecord::Base
  belongs_to :trip
end
