class Event < ApplicationRecord
  belongs_to :creator, class_name: "User",
                       foreign_key: "creator_id"

  has_many :attendances, foreign_key: "attendeed_event_id", class_name: "EventAttendance", dependent: :destroy

  has_many :attendees, through: :attendances

  has_many :invitations, dependent: :destroy

  scope :past, -> { where('date_time < ?', Date.today).order(created_at: :desc) }
  scope :future, -> { where('date_time > ?', Date.today).order(created_at: :desc) }
end
