class EditTrips < ActiveRecord::Migration
  def up
    add_column :trips, :from_airport, :string
    add_column :trips, :to_airport, :string
  end

  def down
    remove_column :trips, :from_airport
    remove_column :trips, :to_airport
  end
end
