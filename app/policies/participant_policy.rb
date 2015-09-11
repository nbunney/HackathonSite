class ParticipantPolicy < ApplicationPolicy
  def create?
    true
  end

  def destroy?
    record.user_id == user.id || user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
