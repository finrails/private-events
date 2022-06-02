class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, class_name: "Event",
                            foreign_key: "creator_id"

  has_many :event_attendances, foreign_key: "attendee_id", dependent: :destroy

  has_many :attendeed_events, through: :event_attendances


  has_many :invitations, class_name: "Invitation", foreign_key: "user_id", dependent: :destroy
  has_many :invites, class_name: "Invitation", foreign_key: "receiver_id", dependent: :destroy

  def event_owner?(event_id:)
    return true if Event.where(id: event_id, creator_id: self.id).exists?

    false
  end

  def page_owner?(page_id:)
    return true if self.id == page_id

    false
  end
end
