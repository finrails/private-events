class AddCreatorReferenceToEvent < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :creator, null: false
  end
end
