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
