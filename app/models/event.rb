class Event < ApplicationRecord
  belongs_to :creator, class_name: "User",
                       foreign_key: "creator_id"
  validates :date, presence: true, length: { in: 6..20 }
end
