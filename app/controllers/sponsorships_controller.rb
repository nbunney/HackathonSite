class SponsorshipsController < ApplicationController
  def index
    @event = Event.friendly.find(params[:event_id])
    @sponsorship_tiers = @event.sponsorship_tiers
  end

  def new
    @event = Event.friendly.find(params[:event])
  end
end
