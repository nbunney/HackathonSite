class SponsorshipsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @sponsorship_tiers = @event.sponsorship_tiers
  end
end
