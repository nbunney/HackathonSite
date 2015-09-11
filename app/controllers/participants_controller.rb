class ParticipantsController < ApplicationController
  before_action :authenticate_user!

  def create
    @participant = Participant.new(user: current_user, event: event)
    authorize @participant

    @participant.save!
    render json: @participant
  end

  def destroy
    @participant = Participant.find(params[:id])
    authorize @participant

    @participant.destroy!
    render json: []
  end

  private

  def event
    @event ||= Event.friendly.find(params[:event_id])
    @event
  end
end
