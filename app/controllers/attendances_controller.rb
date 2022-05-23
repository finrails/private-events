class AttendancesController < ApplicationController
  def create
    @attendance = EventAttendance.new(attendee_id: current_user.id, attendeed_event_id: params[:event_id])

    if @attendance.save
      redirect_to root_path, notice: "Nice! You're in for now, good luck."
    else
      redirect_to root_path, alert: 'Something goes wrong, try do it again.'
    end

  end
end
