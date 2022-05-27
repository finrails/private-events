class Invitation < ApplicationRecord
  scope :waiting, -> { where(status: false)}
  scope :accepted, -> { where(status: true)}
  # Ex:- scope :active, -> {where(:active => true)}
  # Ex:- scope :active, -> {where(:active => true)}

  belongs_to :user
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  belongs_to :event
end
