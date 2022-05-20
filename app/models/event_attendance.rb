class EventAttendance < ApplicationRecord
  belongs_to :attendee, class_name: "User"
  belongs_to :attendeed_event, class_name: "Event"
end
