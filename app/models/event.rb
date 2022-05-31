class Event < ApplicationRecord
  belongs_to :creator, class_name: "User",
                       foreign_key: "creator_id"

  has_many :attendances, foreign_key: "attendeed_event_id", class_name: "EventAttendance"

  has_many :attendees, through: :attendances

  scope :past, -> { where('date_time < ?', Date.today).order(created_at: :desc) }
  scope :future, -> { where('date_time > ?', Date.today).order(created_at: :desc) }
end
