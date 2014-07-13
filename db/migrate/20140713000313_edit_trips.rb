class EditTrips < ActiveRecord::Migration
  def up
    remove_column :trips, :date
    add_column :trips, :start_date, :date
    add_column :trips, :end_date, :date
  end

  def down
    remove_column :trips, :start_date
    remove_column :trips, :end_date
  end
end
