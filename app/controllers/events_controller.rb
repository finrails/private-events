class EventsController < ApplicationController
  def index
    @events = Event.all.includes(:creator)
  end

  def new
    @event = Event.new
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
    params.require(:event).permit(:date)
  end
end
