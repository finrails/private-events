class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all.includes(:creator)
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
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to root_path, notice: "Your event have been created."
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
