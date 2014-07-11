class SeparateDates < ActiveRecord::Migration
  def up
    remove_column :festivals, :date
    add_column :festivals, :start_date, :date
    add_column :festivals, :end_date, :date
  end

  def down
    add_column :festivals, :date, :string
    remove_column :festivals, :start_date
    remove_column :festivals, :end_date
  end
end
