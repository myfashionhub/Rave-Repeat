class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :airline
      t.string :leg1
      t.string :leg2
      t.string :price
      t.string :link
      t.integer :trip_id
      t.timestamps
    end
  end
end
