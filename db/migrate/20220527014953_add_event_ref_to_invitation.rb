class AddEventRefToInvitation < ActiveRecord::Migration[7.0]
  def change
    add_reference :invitations, :event, null: false
  end
end
