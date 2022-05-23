class AddDateTimeToEvent < ActiveRecord::Migration[7.0]
  def change
    change_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :date_time
    end
  end
end
