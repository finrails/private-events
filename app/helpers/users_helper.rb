module UsersHelper
  def in_attendance?(user: nil, event_id: nil)
    user_attendeed_events = user.attendeed_events.all.includes(:creator)
    user_attendeed_events.each do |attendeed_event|
      return true if attendeed_event.id == event_id
    end
    #user_attendance_query = EventAttendance.where(attendee_id: user_id, attendeed_event_id: event_id).first
    #return true if user_attendance_query

    false
  end
end
