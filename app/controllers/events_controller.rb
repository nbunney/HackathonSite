class EventsController < ApplicationController
  # Retrieve
  def index
    @events = Event.all.by_date.reverse
  end

  def show
    @event = Event.friendly.find(params[:id])
    @participant = @event.participant(current_user)
  end

  # Create
  def new
    @event = Event.new
    authorize @event

    @action = 'Create'
    render :edit, layout: 'form'
  end

  def create
    @event = Event.new(permittance)
    authorize @event

    @event.save!
    redirect_to @event
  end

  # Update
  def edit
    @event = Event.friendly.find(params[:id])
    authorize @event

    @action = 'Edit'
    render :edit, layout: 'form'
  end

  def update
    @event = Event.friendly.find(params[:id])
    authorize @event

    @event.assign_attributes(permittance)
    @event.save!
    redirect_to @event
  end

  # Delete
  def destroy
    @event = Event.friendly.find(params[:id])
    @event.destroy!
  end

  private

  def permittance
    # HACK: this was a bad idea
    params[:event][:event_type] = params[:event][:event_type].to_i
    params[:event][:status] = params[:event][:status].to_i
    params.require(:event)
          .permit(:name, :event_type, :description, :date, :image, :status,
                  :location_id)
  end
end
