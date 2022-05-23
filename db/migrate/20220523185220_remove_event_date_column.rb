class RemoveEventDateColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :date
  end
end
