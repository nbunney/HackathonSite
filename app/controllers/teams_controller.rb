class TeamsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @event = Event.friendly.find(params[:event_id])
    @teams = @event.teams
    if user_signed_in?
      @user_team = @event.participant(current_user).team
    end
  end

  def show
    @team = Team.friendly.find(params[:id])
  end

  # Create
  def new
    @event = Event.friendly.find(params[:event_id])
    @team = Team.new(event: @event)
    authorize @team

    @action = 'Create'
    render :edit, layout: 'form'
  end

  def create
    @team = Team.new(permittance)
    @participant = @team.event.participant(current_user)
    authorize @team

    @team.save!
    @participant.update(team_id: @team.id)
    redirect_to event_team_path(@team)
  end

  # Update
  def edit
    @team = Team.friendly.find(params[:id])
    authorize @team

    @action = 'Edit'
    render :edit, layout: 'form'
  end

  def update
    @team = Team.friendly.find(params[:id])
    authorize @team

    @team.assign_attributes(permittance)
    @team.save!
    redirect_to event_team_path(@team)
  end

  # Delete
  def destroy
    @team = Team.friendly.find(params[:id])
    @team.destroy!
  end

  private

  def permittance
    params.require(:team)
          .permit(:name, :event_id)
  end
end
