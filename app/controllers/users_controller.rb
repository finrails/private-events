class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def accept_invitation
    @invitation = Invitation.find(params[:invitation_id])
    unless current_user.page_owner?(page_id: @invitation.receiver_id)
      redirect_to user_path(@invitation.receiver_id), alert: "You're not that user!"

      return false
    end
    @event = Event.find(@invitation.event_id)
    @attendance = @event.attendances.build(attendee_id: @invitation.receiver_id)

    if @invitation.update(status: true) && @attendance.save
      redirect_to user_path(@invitation.receiver_id), notice: "Now, you're in the event!"
    else
      redirect_to root_path, alert: 'Something goes wrong, please try do it again.'
    end
  end
end
