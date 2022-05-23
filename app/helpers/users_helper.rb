module UsersHelper
  def in_attendance?(user_id: nil, event_id: nil)
    user_attendance_query = EventAttendance.where(attendee_id: user_id, attendeed_event_id: event_id).first

    return true if user_attendance_query
    false
  end
end
