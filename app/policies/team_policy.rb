class TeamPolicy < ApplicationPolicy
  def create?
    participant.team_id.blank? if participant
  end

  def update?
    participant.team_id == record.id || user.admin?
  end
  alias_method :destroy, :update?

  private

  def participant
    record.event.participant(user.id) if record.event
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
