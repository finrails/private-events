class AddUserEventReferencesToEventAttendance < ActiveRecord::Migration[7.0]
  def change
    add_reference :event_attendances, :attendee, null: true
    add_reference :event_attendances, :attendeed_event, null: true
  end
end
