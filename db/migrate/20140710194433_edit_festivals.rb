class EditFestivals < ActiveRecord::Migration
  def change
    change_column :festivals, :lineup, :text
    add_column :festivals, :status, :string
  end
end
