# HACK: replace entire voting system, it sucks massive ass
class BallotsController < ApplicationController
  # GET /ballots/new
  def new
    @poll = Poll.find(params[:poll_id])
    @participant = @poll.event.participant(current_user) 
    @own_team = @participant.team

    return redirect_to @poll.event, notice: 'Poll is closed' unless @poll.open?

    # Bail if the user already voted
    if Vote.where(participant: @participant, poll: @poll).count != 0
      redirect_to @poll.event, notice: 'You already voted'
      return
    end
  end

  # POST /ballots
  def create
    @poll = Poll.find(params[:poll_id])
    @participant = @poll.event.participant(current_user)
    @own_team = @participant.team

    return redirect_to @poll.event, notice: 'Poll is closed' unless @poll.open?

    # Bail if the user already voted
    if Vote.where(participant: @participant, poll: @poll).count != 0
      redirect_to @poll.event, notice: 'You already voted'
      return
    end

    # Try doing it
    success = params[:votes].map do |tid, s|
      Vote.new(team_id: tid, score: s, participant: @participant, poll: @poll).save
    end.all?

    if success
      redirect_to @poll.event, notice: 'Vote has been cast'
    else
      redirect_to @poll.event, notice: 'Something went wrong; your vote has not been cast'
    end
  end
end
