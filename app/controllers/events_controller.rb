class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])

    if @event.creator_id != current_user.id
      flash[:alert] = "You're not the post owner!"
      redirect_to events_path
    end

  end

  def unattend
    @event = Event.find(params[:id])
    @attendeed_event = EventAttendance.find_by(attendee_id: current_user.id, attendeed_event_id: @event.id)

    @attendeed_event.destroy

    redirect_to @event, notice: "Now you're not in the event attendance list."
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event, notice: 'Your post has been editted with success!'
    else
      flash.now[:alert] = 'Something goes wrong, please try do it again.'
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    @users = User.all
  end

  def invite
    unless current_user.event_owner?(event_id: params[:id])
      redirect_to event_path(params[:id]), alert: "You're not the event's owner!"
      return false
    end

    @user = User.find(params[:user_id])
    @event = Event.find(params[:id])

    @invite = current_user.invitations.build(receiver_id: @user.id, event_id: @event.id)

    if @invite.save
      redirect_to event_path(@event), notice: "You've invited the user #{@user.email}!"
    else
      redirect_to event_path(@event), alert: "Something goes wrong, try do it again."
    end
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to events_path, notice: "Your event have been created."
    else
      flash.now[:alert] = "Some inputs are invalid, please check it out!"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date_time)
  end
end
