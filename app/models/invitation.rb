class Invitation < ApplicationRecord
  scope :waiting, -> { where(status: false)}
  scope :accepted, -> { where(status: true)}

  belongs_to :user
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  belongs_to :event
end
