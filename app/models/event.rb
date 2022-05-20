class Event < ApplicationRecord
  belongs_to :creator, class_name: "User",
                       foreign_key: "creator_id"

  has_many :attendances, foreign_key: "attendeed_event_id", class_name: "EventAttendance"

  has_many :attendees, through: :attendances

  validates :date, presence: true, length: { in: 6..20 }
end
